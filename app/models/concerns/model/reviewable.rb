module Model
  module Reviewable
    extend ActiveSupport::Concern

    included do
      has_many :reviews, as: :reviewable, class_name: Model.config.review.class_name, dependent: :destroy
    end
  end
end