module Model
  module Character
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.character.table_name

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      has_many :character_in_themes, foreign_key: 'character_id', dependent: :destroy
      has_many :trait_in_characters, foreign_key: 'character_id', dependent: :destroy
      include Model::Clueable
      include Model::Imageable
      has_many :clue_in_characters, foreign_key: 'character_id', dependent: :destroy
      has_many :related_clues, class_name: Model.config.clue.class_name, foreign_key: 'character_id', through: :clue_in_characters
      has_many :plays, class_name: Model.config.play.class_name, foreign_key: 'character_id', dependent: :nullify
      has_many :info_files, foreign_key: 'character_id', dependent: :destroy

      def pickable?; false end

      def search_fail_chance(type = 'normal')
        case type
        when 'deep'
          10
        else
          30
        end
      end
      def search_cost(type = 'normal')
        case type
        when 'deep'
          20
        else
          10
        end
      end
    end
  end
end
