module Model
  module Character
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.character.table_name

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      has_many :character_in_themes, foreign_key: 'character_id', dependent: :destroy
      has_many :traits_in_characters, foreign_key: 'character_id', dependent: :destroy
    end
  end
end
