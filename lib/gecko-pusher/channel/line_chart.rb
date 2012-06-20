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
            [:colour, :axisx, :axisy].each do |setting|
              data[:settings][setting] = options[setting] if options[setting]
            end 
          end
          _push(data)
        end

      end
    end
  end
end

