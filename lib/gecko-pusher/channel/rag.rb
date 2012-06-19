module Gecko
  module Pusher
    module Channel
      class Rag < Base

        def push(red, amber, green)
          data = {
            item: [
              { value: red, text: "" },
              { value: amber, text: "" },
              { value: green, text: "" }
            ]
          }
          _push(data)
        end
      end
    end
  end
end
