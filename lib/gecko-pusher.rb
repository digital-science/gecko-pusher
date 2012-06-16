require "gecko-pusher/channel"
require "gecko-pusher/version"

module Gecko
  module Pusher
    class NotInitializedError < StandardError
    end

    class << self
      attr_accessor :api_key
    end
  end
end
