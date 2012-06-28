module Gecko
  module Pusher
    module Channel
      class Map < Base

        def push(*args)
          data = args.map {|arg|
            if ip_address?(arg)
              {ip: arg}
            elsif lat_long?(arg)
              {latitude: arg[0].to_s, longitude: arg[1].to_s}
            elsif address?(arg)
              {city: arg}
            elsif hostname?(arg)
              {host: arg}
            end
          }

          _push({points: { point: data}})
        end

        protected

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
