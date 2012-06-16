require 'spec_helper'

describe Gecko::Pusher::Channel do
  
  describe "Creating a channel" do
    context "without an API key set" do
      it "should raise a Gecko::Pusher::NotInitializedError" do
        expect {
          Gecko::Pusher::Channel.new("abc123", :text)
        }.should raise_error(Gecko::Pusher::NotInitializedError)
      end
    end
    context "with an API key set" do
      before(:each) do
        Gecko::Pusher.api_key = "ABC123"
      end
      context "without an invalid widget key" do
        it "should raise an ArgumentError" do
          expect {
            Gecko::Pusher::Channel.new(nil, :linechart)
          }.should raise_error(ArgumentError)
        end
      end
      context "with an invalid type" do
        it "should raise an ArgumentError" do
          expect {
            Gecko::Pusher::Channel.new("abc123", :invalid_type)
          }.should raise_error(ArgumentError)
        end
      end
    end
  end

end
