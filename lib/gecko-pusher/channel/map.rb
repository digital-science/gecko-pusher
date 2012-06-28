module Gecko
  module Pusher
    module Channel
      class Map < Base

        def push(*args)
          data = args.map {|arg|
            point_data, options = if arg.is_a?(Array) &&
                                    arg.length == 2 &&
                                    arg.last.is_a?(Hash)
                                    [arg.first, check_options(arg.last)]
                                  else
                                    [arg, {}]
                                  end

            if ip_address?(point_data)
              {ip: point_data}.merge(options)
            elsif lat_long?(point_data)
              {latitude: point_data[0].to_s, longitude: point_data[1].to_s}.merge(options)
            elsif address?(point_data)
              {city: point_data}.merge(options)
            elsif hostname?(point_data)
              {host: point_data}.merge(options)
            end
          }

          _push({points: { point: data}})
        end

        protected

          def check_options(options)
            raise ArgumentError unless options.keys.all? {|k|
              [:color, :size, :cssClass].include?(k)
            }
            options
          end

          def ip_address?(point_data)
            point_data.is_a?(String) &&
              point_data =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
          end

          def lat_long?(point_data)
            point_data.length == 2 &&
              point_data.all? { |p| p.is_a? Float }
          end

          def address?(point_data)
            point_data.is_a?(Hash) &&
              point_data.keys.all? {|k| [:city_name, :region_code, :country_code].include?(k)}
          end

          def hostname?(point_data)
            point_data.is_a?(String)
          end
      end
    end
  end
end
