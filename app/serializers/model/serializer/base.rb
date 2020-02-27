module Model
  module Serializer
    # TODO 모델별 Serializer 만들기
    class Base
      include FastJsonapi::ObjectSerializer
      cache_options enabled: true, cache_length: 12.hours

      BASE_URL = "http://localhost:3000"

      class << self
        # Overrides
        def reflected_record_type
          return @reflected_record_type if defined?(@reflected_record_type)

          @reflected_record_type ||= begin
            self.name.split('::').last.underscore.to_sym
          end
        end
      end
    end
  end
end