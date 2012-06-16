require 'spec_helper'

describe Gecko::Pusher do

  describe "Creating a channel" do
    context "without setting an API key" do
      before(:each) do
        Gecko::Pusher.api_key = nil
      end
      it "should raise a Gecko::Pusher::NotInitializedError" do
        expect {
          Gecko::Pusher.channel(:text, "widget_key")
        }.should raise_error(Gecko::Pusher::NotInitializedError)
      end
    end
    context "after setting an API key" do
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
