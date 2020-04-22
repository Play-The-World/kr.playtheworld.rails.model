module Model
  module Play
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.play.table_name
  
      # Relations
      belongs_to :user
      belongs_to :theme, class_name: Model.config.theme.class_name
      belongs_to :super_play, class_name: Model.config.super_play.class_name, counter_cache: true
      has_many :tracks, foreign_key: "play_id"
      has_many :stage_lists, -> { order('tracks.id': :asc) }, through: :tracks
      # TODO stages 메소드 작성하거나 Relation으로 설정하기
      include Model::Clearer

      # Scopes
      # scope :finished, -> { where.not(finished_at: nil) }

      # 현재 스테이지 => Stage?
      def current_stage
        current_stage_list.stages.limit(1).offset(stage_index).take
      rescue
        current_stage_list.stages.first
      end
      # 현재 스테이지 리스트 => StageList?
      def current_stage_list
        stage_lists.limit(1).offset(stage_list_index).take
      rescue
        stage_lists.first
      end

      def self.serializer
        Model::Serializer::Play
      end
    end
  end
end
