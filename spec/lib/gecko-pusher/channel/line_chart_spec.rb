require 'spec_helper'

describe Gecko::Pusher::Channel::LineChart do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:line_chart, WIDGET_KEY)
  end

  it "should initiate a line chart channel" do
    @channel.should be_a(Gecko::Pusher::Channel::LineChart)
  end

  it "should push a basic array of values" do
    data = {
      item: [ 1,2,3,4,5 ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push([1,2,3,4,5])
    stub.should have_been_requested
  end

  it "should push values with line colour" do
    data = {
      item: [1,2,3,4,5],
      settings: {
        colour: "#FFFFFF"
      }
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push([1,2,3,4,5], colour: "#FFFFFF")
    stub.should have_been_requested
  end

end
