module Model
  module Entryable
    extend ActiveSupport::Concern

    included do
      has_many :entries, as: :entryable, dependent: :destroy
      has_many :users, through: :entries, class_name: Model.config.user.class_name
    end
  end
end