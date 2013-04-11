require 'spec_helper'

describe Gecko::Pusher::Channel::LineChart do
  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:pie_chart, WIDGET_KEY)
  end

  it "should initiate a pie chart channel" do
    @channel.should be_a(Gecko::Pusher::Channel::PieChart)
  end

  it "should push an array of arrays" do
    data = {
      item: [
             { value: 100, label: 'May', colour: 'FFFF10AA' },
             { value: 160, label: 'June', colour: 'FFAA0AAA' }
            ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push([100, 'May', 'FFFF10AA'], [160, 'June', 'FFAA0AAA'])
    stub.should have_been_requested
  end
end
