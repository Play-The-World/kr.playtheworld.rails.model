module Model
  module Poster
    extend ActiveSupport::Concern

    included do
      has_many :posts, as: :poster, class_name: Model.config.post.class_name, dependent: :destroy
    end
  end
end