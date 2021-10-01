module Model
  module Clue
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.clue.table_name

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      # belongs_to :character, class_name: Model.config.character.class_name, optional: true
      belongs_to :clueable, polymorphic: true, optional: true
      has_many :clue_in_inventories, foreign_key: 'clue_id'
      has_many :clue_in_themes, foreign_key: 'clue_id'
      has_many :clue_in_characters, foreign_key: 'clue_id'
      has_many :characters, class_name: Model.config.character.class_name, through: :clue_in_characters, foreign_key: 'clue_id'
      include Model::Imageable

      def computed_chance(search_type = 'normal')
        l = level.to_f

        case search_type
        when 'deep'
          l = l / 2 if l != 1
        else
        end

        (chance / l).to_i
      end
    end
  end
end
