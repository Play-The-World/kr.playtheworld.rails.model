module Model
  module Review
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.review.table_name
      
      # Relations
      belongs_to :reviewable, polymorphic: true
      belongs_to :reviewer, polymorphic: true
      include Model::Commentable
  
      # Translations
      include Model::Translatable
      translates :title, :content
    end
  end
end