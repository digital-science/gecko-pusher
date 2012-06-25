module Gecko
  module Pusher
    module Channel
      class Number < Base

        def push(*args)
          data = {item: extract_values(*args)}
          _push(data)
        end

        protected

          def extract_values(*args)
            values = if just_values?(*args)
                       args.map {|arg| {value: arg}}
                     elsif values_and_descriptions?(*args)
                       args.each_slice(2).map {|arg| 
                         {value: arg.first, text: arg.last}
                       }
                     end
          end

          def just_values?(*args)
            (args.length == 1 || args.length == 2) &&
              args.all? {|arg| arg.is_a?(Integer)}
          end

          def values_and_descriptions?(*args)
            (args.length == 2 || args.length == 4) &&
              args[0].is_a?(Integer) && args[1].is_a?(String) &&
              args[2].is_a?(Integer) && args[3].is_a?(String)
          end
      end
    end
  end
end
