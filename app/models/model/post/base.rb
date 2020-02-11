module Model
  module Post
    class Base < ApplicationRecord
      # Table
      self.table_name = Model.config.post.table_name

      # Relations
      belongs_to :board, class_name: Model.config.board.class_name, counter_cache: true
      include Model::Commentable
      belongs_to :poster, polymorphic: true
      include Model::Viewable

      # Translations
      include Model::Translatable
      translates :title, :content

    end
  end
end
