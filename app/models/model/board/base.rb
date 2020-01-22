module Model
  module Board
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.board.table_name

      # Relations
      belongs_to :boardable, polymorphic: true
      has_many :posts, class_name: Model.config.post.class_name, dependent: :destroy

      # Translations
      include Model::Translatable
      translates :title, :content
    end
  end
end
