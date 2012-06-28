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
            {ip: "1.2.3.4"}
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push("1.2.3.4")
      stub.should have_been_requested
    end

    it "should push a lat/long" do
      data = {
        points: {
          point: [
            {latitude: "51.0001",longitude: "-51.0001"}
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push([51.0001, -51.0001])
      stub.should have_been_requested
    end

    it "should push an address" do
      data = {
        points: {
          point: [
            {city: {
              city_name: "London",
              country_code: "GB"
            }}
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push({city_name: "London", country_code: "GB"})
      stub.should have_been_requested
    end

    it "should push a hostname" do
      data = {
        points: {
          point: [
            {host: "gecko.dsci.it"}
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push("gecko.dsci.it")
      stub.should have_been_requested
    end

    it "should push multiple values" do
      data = {
        points: {
          point: [
            {host: "gecko.dsci.it"},
            {ip: "1.2.3.4"},
            {latitude: "51.0001",longitude: "-51.0001"}
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push(
        "gecko.dsci.it",
        "1.2.3.4",
        [51.0001, -51.0001]
      )
      stub.should have_been_requested

    end
  end

  context "pushing values with additional metadata" do

    it "should raise ArgumentError if invalid point option passed" do
      expect {
        @channel.push(["gecko.dsci.it", {not_an_option: 8}])
      }.should raise_error(ArgumentError)
    end

    it "should push multiple values" do
      data = {
        points: {
          point: [
            {host: "gecko.dsci.it", size: 8},
            {ip: "1.2.3.4", color: "ff0000"},
            {latitude: "51.0001",longitude: "-51.0001", cssClass: "classname"}
          ]
        }
      }
      stub = stub_gecko_post(WIDGET_KEY, data)
      @channel.push(
        ["gecko.dsci.it", {size: 8}],
        ["1.2.3.4", {color: "ff0000"}],
        [[51.0001, -51.0001], {cssClass: "classname"}]
      )
      stub.should have_been_requested

    end

  end

end
