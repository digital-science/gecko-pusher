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
            values = if(args.length == 2 and args.all? {|arg| arg.is_a?(Integer)})
                       args.map {|arg| {value: arg}}
                     end
          end
      end
    end
  end
end
