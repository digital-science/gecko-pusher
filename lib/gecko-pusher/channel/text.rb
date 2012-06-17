module Gecko
  module Pusher
    module Channel
      class Text < Base

        def push(*args)
          return if args.empty?
          data = { item: extract_items(*args) }
          _push(data)
        end

        private

          def extract_items(*args)
            message_type, messages = extract_message_type_and_messages(*args)
            messages.map {|arg| {text: arg, type: message_type} }
          end

          def extract_message_type_and_messages(*args)
            text_type = args.first.is_a?(Integer) ? args.shift : Gecko::Pusher::TEXT_NONE
            args.delete_if {|arg| arg.is_a? Integer}
            [text_type, args]
          end

          def multiple_types?(*args)

          end
      end
    end
  end
end
