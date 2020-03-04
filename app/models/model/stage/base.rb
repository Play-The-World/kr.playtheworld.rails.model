module Model
  module Stage
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.stage.table_name

      # Translations
      include Model::Translatable
      translates :content

      # Relations
      belongs_to :stage_list
      include Model::Imageable
      include Model::Videoable
      include Model::Audioable
      include Model::Textable
      include Model::Interpolatable

      # Enums
      # include Enumerize
      # enumerize :stage_type, in: %i(script quiz end)

      # Scopes
      default_scope { order(order: :asc) }

      def self.serializer
        Model::Serializer::Stage
      end
    end
  end
end