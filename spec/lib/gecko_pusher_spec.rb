require 'spec_helper'

describe Gecko::Pusher do

  describe "Creating a channel" do
    context "without an API key set" do
      it "should raise a Gecko::Pusher::NotInitializedError" do
        expect {
          Gecko::Pusher.channel(:text, "widget_key")
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
            Gecko::Pusher.channel(:text, nil)
          }.should raise_error(ArgumentError)
        end
      end
      context "with an invalid type" do
        it "should raise an ArgumentError" do
          expect {
            Gecko::Pusher.channel(:invalid_type, "abc123")
          }.should raise_error(ArgumentError)
        end
      end
    end
  end
  
end
