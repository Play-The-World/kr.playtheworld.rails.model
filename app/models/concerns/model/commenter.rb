module Model
  module Commenter
    extend ActiveSupport::Concern

    included do
      has_many :comments, as: :commenter, class_name: Model.config.comment.class_name, dependent: :destroy
    end
  end
end