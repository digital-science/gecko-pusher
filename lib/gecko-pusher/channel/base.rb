require 'json'

module Gecko
  module Pusher
    module Channel
      class Base

        def initialize(widget_key)
          @widget_key = widget_key
        end

        protected
          
          def _push(data)
            payload = {
              api_key: Gecko::Pusher.api_key,
              data: data
            }
            Gecko::Pusher.connection.post do |req|
              req.url "/v1/send/#{@widget_key}"
              req.body = payload.to_json
            end
          end

          def extract_options(args)
            args.last.is_a?(Hash) ? args.pop : {}
          end

      end
    end
  end
end
