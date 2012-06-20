module Gecko
  module Pusher
    module Channel
      class LineChart < Base

        def push(points, options = {})
          data = {
            item: points
          }
          unless options.empty?
            data[:settings] = {}
            data[:settings][:colour] = options[:colour ] if options[:colour]
          end
          _push(data)
        end

      end
    end
  end
end

