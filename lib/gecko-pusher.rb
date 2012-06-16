require 'active_support/inflector'
require 'faraday'

require 'gecko-pusher/channel'
require 'gecko-pusher/version'

module Gecko
  module Pusher

      CHANNEL_TYPES = [
        :text, :map, :number, :rag, :rag_col, :line_chart,
        :pie_chart, :gecko_meter, :funnel, :bullet
      ]

    class NotInitializedError < StandardError
    end

    class << self
      attr_accessor :api_key

      def channel(widget_type, widget_key)
        raise NotInitializedError if api_key.nil?
        raise ArgumentError.new("widget_key cannot be nil") if widget_key.nil?
        raise ArgumentError unless CHANNEL_TYPES.include?(widget_type)

        "Gecko::Pusher::Channel::#{widget_type.to_s.camelize}".constantize.new(widget_key)
      end

      def connection
        @connection ||= Faraday.new(:url => "https://push.geckoboard.com") do |builder|
          builder.adapter :net_http
        end
      end
    end
  end
end
