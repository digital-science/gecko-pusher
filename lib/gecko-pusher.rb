require "gecko-pusher/channel"
require "gecko-pusher/version"

module Gecko
  module Pusher

      CHANNEL_TYPES = [
        :text, :map, :number, :rag, :ragcol, :linechart,
        :piechart, :geckometer, :funnel, :bullet
      ]

    class NotInitializedError < StandardError
    end

    class << self
      attr_accessor :api_key

      def channel(widget_key, widget_type)
        raise NotInitializedError if Gecko::Pusher::api_key.nil?
        raise ArgumentError.new("widget_key cannot be nil") if widget_key.nil?
        raise ArgumentError unless CHANNEL_TYPES.include?(widget_type)
      end
    end
  end
end
