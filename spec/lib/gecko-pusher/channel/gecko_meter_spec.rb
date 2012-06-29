require 'spec_helper'

describe Gecko::Pusher::Channel::GeckoMeter do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:gecko_meter, WIDGET_KEY)
  end

  it "should initiate a gecko meter channel" do
    @channel.should be_a(Gecko::Pusher::Channel::GeckoMeter)
  end

  it "should push basic value, min and max" do
    data = {
      item: 10,
      min: { value: 0 },
      max: { value: 20 }
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(10, 0, 20)
    stub.should have_been_requested
  end

  it "should push values with descriptions" do
    data = {
      item: 10,
      min: { value: 0, text: "Min" },
      max: { value: 20, text: "Max" }
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(10, 0, "Min", 20, "Max")
    stub.should have_been_requested
  end

  it "should allow type option to be passed" do
    data = {
      item: 10,
      min: { value: 0 },
      max: { value: 20 },
      type: "reverse"
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(10, 0, 20, type: "reverse")
    stub.should have_been_requested
  end

  it "should raise an ArgumentError for invalid arguments" do
    expect {
      @channel.push("an invalid argument")
    }.should raise_error(ArgumentError)
  end

end
