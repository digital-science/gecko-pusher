require 'spec_helper'

describe Gecko::Pusher::Channel::Map do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:map, WIDGET_KEY)
  end

  it "should initiate a map channel" do
    @channel.should be_a(Gecko::Pusher::Channel::Map)
  end

  context "pushing simple values" do

    it "should push an IP address" do
      data = {
        points: {
          point: [
            ip: "1.2.3.4"
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push("1.2.3.4")
      stub.should have_been_requested
    end
  end

end
