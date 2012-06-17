module Gecko
  module Pusher
    module Channel
      class Text < Base

        def push(*args)
          data = { item: extract_items(*args) }
          _push(data)
        end

        private

          def extract_items(*args)
            args.map {|arg| {text: arg, type: 0} }
          end
      end
    end
  end
end
