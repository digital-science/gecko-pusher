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
            message_groups = multiple_types?(*args) ? args : [args]
            items = []
            message_groups.each do |message_group|
              message_type, messages = extract_message_type_and_messages(*message_group)
              messages.each {|msg| 
                items << {text: msg, type: message_type} 
              }
            end
            items
          end

          def extract_message_type_and_messages(*args)
            text_type = args.first.is_a?(Integer) ? args.shift : Gecko::Pusher::TEXT_NONE
            args.delete_if {|arg| arg.is_a? Integer}
            [text_type, args]
          end

          def multiple_types?(*args)
            unless args.select {|arg| arg.is_a? Array }.empty?
              raise_argument_error_if_arguments_contain_non_array(*args)
              return true
            end
            false
          end

          def raise_argument_error_if_arguments_contain_non_array(*args)
            raise ArgumentError.new("Must call with a single message type or an array of message types.\nArgs: #{args.inspect.to_s}") unless args.reject {|arg| arg.is_a? Array }.empty?
          end
      end
    end
  end
end
