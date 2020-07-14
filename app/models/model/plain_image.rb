module Model
  class PlainImage < ApplicationRecord

    def url
      "#{base_url}/#{i.id}"
    end

    def self.base_url
      case Rails.env
      when "development"
        "http://localhost:3000/v1/making/test/images"
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
