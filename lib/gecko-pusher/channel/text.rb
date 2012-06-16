module Gecko
  module Pusher
    module Channel
      class Text < Base

        def push(*args)
          data = {
            item: [{text: args.first, type: 0}]
          }
          _push(data)
        end
      end
    end
  end
end
