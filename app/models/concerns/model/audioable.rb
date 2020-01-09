module Model
  module Audioable
    extend ActiveSupport::Concern

    included do
      has_many :audios, as: :audioable, dependent: :destroy
    end
  end
end