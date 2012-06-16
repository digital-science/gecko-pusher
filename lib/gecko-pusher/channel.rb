module Gecko
  module Pusher
    class Channel

      VALID_TYPES = [:text, :map, :number, :rag, :ragcol, :linechart, :piechart, :geckometer, :funnel, :bullet]

      def initialize(widget_key, widget_type)
        raise NotInitializedError if Gecko::Pusher::api_key.nil?
        raise ArgumentError.new("widget_key cannot be nil") if widget_key.nil?
        raise ArgumentError unless VALID_TYPES.include?(widget_type)
      end
    end
  end
end
