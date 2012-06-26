require 'spec_helper'

describe Gecko::Pusher::Channel::RagCol do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:rag_col, WIDGET_KEY)
  end

  it "should initiate a RAG Column channel" do
    @channel.should be_a(Gecko::Pusher::Channel::RagCol)
  end

  it "should push RAG values" do
    data = {
      item: [
        { value: 100 },
        { value: 200 },
        { value: 300 }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(100, 200, 300)
    stub.should have_been_requested
  end

  it "should push RAG values and descriptions" do
    data = {
      item: [
        { value: 100, text: "red description" },
        { value: 200, text: "amber description" },
        { value: 300, text: "green description" }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(100, "red description",
                  200, "amber description",
                  300, "green description")
    stub.should have_been_requested
  end
end

