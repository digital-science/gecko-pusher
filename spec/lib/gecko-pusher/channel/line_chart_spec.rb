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

end
