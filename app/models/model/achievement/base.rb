module Model
  module Achievement
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.achievement.table_name

      # Translations
      include Translatable
      translates :title, :content, :condition_content

      # Relations
      belongs_to :object, polymorphic: true, optional: true
      has_many :users_achievements, dependent: :destroy, foreign_key: "achievement_id"
      has_many :users, through: :users_achievements, class_name: Model.config.user.class_name
      include Model::Imageable
      include Model::Interpolatable
      include Model::EventTarget

      def self.serializer
        Model::Serializer::Achievement
      end

      def level_string
        self.class.level_string(self.level)
      end
      def self.level_string(level)
        case level
        when 2
          "일반"
        when 4
          "희귀"
        when 6
          "영웅"
        when 8
          "전설"
        else
          "???"
        end
      end
    end
  end
end
