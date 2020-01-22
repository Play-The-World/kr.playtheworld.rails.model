module Model
  module Reviewer
    extend ActiveSupport::Concern

    included do
      has_many :reviews, as: :reviewer, class_name: Model.config.review.class_name, dependent: :destroy
    end
  end
end