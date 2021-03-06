require 'spec_helper'

describe Gecko::Pusher::Channel::Text do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:text, WIDGET_KEY)
  end

  it "should initiate a Text channel" do
    @channel.should be_a(Gecko::Pusher::Channel::Text)
  end
  it "should not push at all if no message is sent" do
    stub = stub_gecko_post(WIDGET_KEY, {})
    @channel.push()
    stub.should_not have_been_requested
  end
  it "should push a single plain message" do
    data = {
      item: [
        { text: "Message", type: 0 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push("Message")
    stub.should have_been_requested
  end

  it "should push a single ALERT message" do
    data = {
      item: [
        { text: "Message", type: 1 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(Gecko::Pusher::TEXT_ALERT, "Message")
    stub.should have_been_requested
  end

  it "should push multiple plain messages" do
    data = {
      item: [
        { text: "Message 1", type: 0 },
        { text: "Message 2", type: 0 },
        { text: "Message 3", type: 0 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push("Message 1", "Message 2", "Message 3")
    stub.should have_been_requested
  end

  it "should push multiple ALERT messages" do
    data = {
      item: [
        { text: "Message 1", type: 1 },
        { text: "Message 2", type: 1 },
        { text: "Message 3", type: 1 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(Gecko::Pusher::TEXT_ALERT, "Message 1", "Message 2", "Message 3")
    stub.should have_been_requested
  end

  it "should silently ignore unecessary message types in arguments" do
    data = {
      item: [
        { text: "Message 1", type: 1 },
        { text: "Message 2", type: 1 },
        { text: "Message 3", type: 1 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(Gecko::Pusher::TEXT_ALERT, "Message 1", "Message 2", Gecko::Pusher::TEXT_INFO, "Message 3")
    stub.should have_been_requested
  end

  it "should push a combination of many message types" do
    data = {
      item: [
        { text: "Message 1", type: 0 },
        { text: "Message 2", type: 0 },
        { text: "Message 3", type: 1 },
        { text: "Message 4", type: 1 },
        { text: "Message 5", type: 2 },
        { text: "Message 6", type: 2 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(
      ["Message 1", "Message 2"],
      [Gecko::Pusher::TEXT_ALERT, "Message 3", "Message 4"],
      [Gecko::Pusher::TEXT_INFO, "Message 5", "Message 6"]
    )
    stub.should have_been_requested
  end
end
