require 'spec_helper'

describe Gecko::Pusher::Channel::Number do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:number, WIDGET_KEY)
  end

  it "should initiate a number channel" do
    @channel.should be_a(Gecko::Pusher::Channel::Number)
  end

  it "should push a single value" do
    data = {
      item: [
        { value: 123 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(123)
    stub.should have_been_requested
  end
  it "should push two basic values" do
    data = {
      item: [
        { value: 123 },
        { value: 456 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(123, 456)
    stub.should have_been_requested
  end
  it "should push two values with descriptions" do
    data = {
      item: [
        { value: 123, text: "This week" },
        { value: 456, text: "Last week" }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(123, "This week", 456, "Last week")
    stub.should have_been_requested
  end
  it "should push options" do
    data = {
      item: [
        { value: 123 },
        { value: 456 }
      ],
      type: "reverse",
      absolute: true
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(123, 456, type: "reverse", absolute: true)
    stub.should have_been_requested
    
  end
end
