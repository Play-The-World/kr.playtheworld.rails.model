module Model
  class ThemeData < ApplicationRecord
    # Relations
    belongs_to :theme, class_name: Model.config.theme.class_name
    has_many :stage_lists, dependent: :destroy
    has_many :stages, through: :stage_lists, class_name: Model.config.stage.class_name
    has_many :items, dependent: :destroy
    has_many :plays, dependent: :destroy, class_name: Model.config.play.class_name
    # has_many :super_plays, dependent: :destroy, counter_cache: true, foreign_key: "theme_data_id"
    include Model::Eventable
    include Model::EventTarget
    include Model::Musicable

    # Callbacks
    before_create :set_version

    def self.serializer
      Model::Serializer::ThemeData
    end

    def stages
      Model.config.stage.constant
        .joins(stage_list: :theme_data)
        .includes(:translations)
        .where("#{table_name}": { id: id } )
    end

    def test
      Model.config.stage.constant.joins(stage_list: :theme_data).includes(:translations).where("#{Model::ThemeData.table_name}": { id: 1 } )
    end

    def start_stage_list
      stage_lists.find_by(number: start_stage_list_number) || stages_lists.first
    end

    private
      def set_version
        version = theme.theme_data.size + 1
      end
  end
end