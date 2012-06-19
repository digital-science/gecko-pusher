module Gecko
  module Pusher
    module Channel
      class LineChart < Base

        def push(*args)
          data = {
            item: args
          }
          _push(data)
        end

      end
    end
  end
end

