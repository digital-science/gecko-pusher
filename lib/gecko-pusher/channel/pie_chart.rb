module Gecko
  module Pusher
    module Channel
      class PieChart < Base

        def push(*args)
          items = []
          data = { item: items }

          args.each do |i|
            items.concat([{value: i[0], label: i[1], colour: i[2] }])
          end

          _push(data)
        end
      end
    end
  end
end
