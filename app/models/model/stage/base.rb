module Model
  module Stage
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.stage.table_name

      # New in Rails 6! TEST NEEDED
      self.implicit_order_column = 'order'

      # Translations
      include Model::Translatable
      translates :content

      # Relations
      belongs_to :stage_list
      has_many :canvases, foreign_key: "stage_id", dependent: :destroy
      include Model::Imageable
      include Model::Videoable
      include Model::Audioable
      include Model::Textable
      include Model::Interpolatable
      include Model::Conditioner

      # Enums
      # extend Enumerize
      # enumerize :stage_type, in: %i(script quiz end)

      # Scopes
      # default_scope { order(order: :asc) }

      def self.serializer
        Model::Serializer::Stage
      end
    end
  end
end