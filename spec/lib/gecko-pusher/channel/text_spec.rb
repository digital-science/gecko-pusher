require 'spec_helper'

describe Gecko::Pusher::Channel::Text do

  API_KEY = "api_key"
  WIDGET_KEY = "text_widget"

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:text, WIDGET_KEY)
  end

  it "should initiate a Text channel" do
    @channel.should be_a(Gecko::Pusher::Channel::Text)
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
end
