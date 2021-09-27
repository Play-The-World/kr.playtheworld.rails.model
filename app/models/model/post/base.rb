module Model
  module Post
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table
      self.table_name = Model.config.post.table_name

      # Relations
      belongs_to :board, class_name: Model.config.board.class_name, counter_cache: "posts_count"
      include Model::Commentable
      belongs_to :poster, polymorphic: true, optional: true
      include Model::Viewable
      include Model::Topicable
      include Model::Reportable

      # Translations
      # include Model::Translatable
      # translates :title, :content


      def self.serializer
        Model::Serializer::Post
      end
    end
  end
end
