module Model
  class PlainAudio < ApplicationRecord
    def self.serializer
      Model::Serializer::PlainAudio
    end
  end
end
