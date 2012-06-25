require 'spec_helper'

describe Gecko::Pusher::Channel::Rag do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:number, WIDGET_KEY)
  end

  it "should initiate a number channel" do
    @channel.should be_a(Gecko::Pusher::Channel::Number)
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
end
