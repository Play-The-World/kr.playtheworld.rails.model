module Model
  module Play
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.play.table_name
  
      # Relations
      belongs_to :user
      # belongs_to :theme, class_name: Model.config.theme.class_name
      belongs_to :theme_data
      belongs_to :super_play, class_name: Model.config.super_play.class_name, counter_cache: true
      has_many :tracks, dependent: :destroy, foreign_key: 'play_id'
      has_many :stage_lists, -> { order("#{Model::Track.table_name}.id": :asc) }, through: :tracks
      has_one :inventory, foreign_key: 'play_id'
      # TODO stages 메소드 작성하거나 Relation으로 설정하기
      include Model::Clearer

      # Scopes
      # scope :finished, -> { where.not(finished_at: nil) }

      # Status
      include Model::HasStatus
      set_status %i(default)

      # Callbacks
      after_create :init_play

      def stages
        Model.stage.constant
          .joins(stage_list: :plays)
          .includes(:translations)
          .where("#{table_name}": { id: id })
      end

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

      def playing?; false end
      def finished?; false end

      private
        def init_play
          # 첫 스테이지 리스트
          stage_lists << theme_data.start_stage_list
          # Inventory
          create_inventory
        end

        def hints
          current_stage_list.hints
        end
    end
  end
end
