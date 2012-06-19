module Gecko
  module Pusher
    module Channel
      class Rag < Base

        def push(*args)
          data = if is_basic_rag?(*args)
            { item: [ { value: args[0] }, { value: args[1] }, { value: args[2] } ] }
                 elsif is_basic_rag_with_descriptions?(*args)
            { item: [ { value: args[0], text: args[1] },
              { value: args[2], text: args[3]},
              { value: args[4], text: args[5]} ] }
          end
          _push(data)
        end

        private
          
          def is_basic_rag?(*args)
            args.length == 3 && args.all? {|arg| arg.is_a? Integer}
          end

          def is_basic_rag_with_descriptions?(*args)
            args.length == 6 &&
              args[0].is_a?(Integer) &&
              args[2].is_a?(Integer) &&
              args[4].is_a?(Integer) &&
              args[1].is_a?(String) &&
              args[3].is_a?(String) &&
              args[5].is_a?(String)
          end
      end
    end
  end
end
