module Model
  class Stage < ApplicationRecord
    # New in Rails 6! TEST NEEDED
    self.implicit_order_column = 'order'

    # Translations
    include Model::Translatable
    translates :content, :title # 혹시 몰라 title 추가

    # Relations
    belongs_to :stage_list, class_name: Model.config.stage_list.class_name
    # has_many :canvases, foreign_key: "stage_id", dependent: :destroy
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