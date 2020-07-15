module Model
  class PlainImage < ApplicationRecord
    def url
      "#{self.class.base_url}/#{self.id}"
    end

    def self.base_url
      case Rails.env
      when "development"
        "http://192.168.0.14:3000/v1/making/test/images"
      when "production"
        "http://api.playthe.world/v1/making/test/images"
      else
        "/v1/making/test/images"
      end
    end

    def self.serializer
      Model::Serializer::PlainImage
    end
  end
end
