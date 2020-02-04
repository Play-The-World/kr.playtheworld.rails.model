module Model
  module Serializer
    # TODO 모델별 Serializer 만들기
    class Base
      include FastJsonapi::ObjectSerializer
      cache_options enabled: true, cache_length: 12.hours
    end
  end
end