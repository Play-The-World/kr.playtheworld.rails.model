module Model
  module Clue
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.clue.table_name

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      belongs_to :character, class_name: Model.config.character.class_name, optional: true
      belongs_to :clueable, polymorphic: true, optional: true
      has_many :clue_in_inventories, foreign_key: 'clue_id'
      has_many :clue_in_themes, foreign_key: 'clue_id'
    end
  end
end
