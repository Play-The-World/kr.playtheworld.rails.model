module Model
  module Commentable
    extend ActiveSupport::Concern

    included do
      has_many :comments, as: :commentable, class_name: Model.config.comment.class_name, dependent: :destroy
    end
  end
end