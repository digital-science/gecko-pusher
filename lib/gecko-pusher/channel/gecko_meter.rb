module Gecko
  module Pusher
    module Channel
      class GeckoMeter < Base

        def push(*args)
          options = extract_options(args)
          data = extract_values(args)
          data[:type] = options[:type] unless options[:type].nil?
          _push(data)
        end

        protected

          def extract_values(args)
            if just_values?(args)
              {
                item: args[0], 
                min: { value: args[1] }, 
                max: { value: args[2]}
              }
            elsif values_and_descriptions?(args)
              {
                item: args[0], 
                min: { value: args[1], text: args[2] }, 
                max: { value: args[3], text: args[4] }
              }
            else
              raise ArgumentError
            end
          end

          def just_values?(values)
            values.length == 3 &&
              values.all? {|a| a.is_a?(Integer)}
          end

          def values_and_descriptions?(values)
            values.length == 5 &&
              values[0].is_a?(Integer) &&
              values[1].is_a?(Integer) && values[2].is_a?(String) &&
              values[3].is_a?(Integer) && values[4].is_a?(String)
          end
      end
    end
  end
end
