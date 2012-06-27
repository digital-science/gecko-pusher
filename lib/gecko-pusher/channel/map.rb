module Gecko
  module Pusher
    module Channel
      class Map < Base

        def push(*args)
          data = args.map {|arg|
            if arg.is_a?(String) and arg =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
              {ip: arg}
            end
          }

          _push({points: { point: data}})
        end
      end
    end
  end
end
