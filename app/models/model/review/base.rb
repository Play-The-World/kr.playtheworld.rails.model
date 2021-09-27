module Model
  module Review
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.review.table_name
      
      # Relations
      belongs_to :reviewable, polymorphic: true
      belongs_to :reviewer, polymorphic: true
      include Model::Commentable
      include Model::Reportable
  
      # Translations
      # include Model::Translatable
      # translates :title, :content

      def self.serializer
        Model::Serializer::Review
      end
    end
  end
end