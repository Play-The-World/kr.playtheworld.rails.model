module Model
  module Musicable
    extend ActiveSupport::Concern

    included do
      has_many :musics, as: :musicable, dependent: :destroy
    end
  end
end