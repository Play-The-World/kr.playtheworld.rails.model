module Model
  module Character
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.character.table_name

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      has_many :character_in_themes, foreign_key: 'character_id', dependent: :destroy
      has_many :trait_in_characters, foreign_key: 'character_id', dependent: :destroy
      include Model::Clueable
      include Model::Imageable
      has_many :related_clues, class_name: Model.config.clue.class_name, foreign_key: 'character_id', dependent: :nullify
      has_many :plays, class_name: Model.config.play.class_name, foreign_key: 'character_id', dependent: :nullify

      def pickable?; false end
    end
  end
end
