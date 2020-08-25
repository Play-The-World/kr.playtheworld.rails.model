module Model
  class StageList < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # Translations
    include Model::Translatable
    translates :title
    
    # Relations
    belongs_to :theme_data
    has_many :stages, -> { order(order: :asc) }, class_name: Model.config.stage.class_name, dependent: :destroy
    has_one :stage_list_type, dependent: :destroy
    has_many :tracks, dependent: :destroy
    has_many :plays, through: :tracks, class_name: Model.config.play.class_name
    include Model::Conditioner

    # Scopes
    # default_scope { includes(stage_list_type: [:answers, :hints, :coordinate], stages: []) }

    # Callbacks
    before_create :set_stage_list_number
    after_create :create_stage_list_type

    # 유효성 검사 => Bool
    def is_valid?
      # 가장 마지막 스테이지가 Quiz or End 스테이지인지 검사
      stages.last.is_a?(Model::Stage::Quiz) or stages.last.is_a?(Model::Stage::End)
    rescue # ActiveRecord::RecordNotFound => e
      false
    end

    # 해당하는 Answer를 찾음 => Answer?
    def answer(user_answer = nil)
      # _answer = answers.where(value: user_answer).or(answers.where(type: Model::Answer::Pass.to_s)).take
      get_answers_by(user_answer).take
    rescue
      nil
    end

    def get_answers_by(user_answer = nil)
      # TODO: case_sensitive, ordered 구현
      # TODO: 이러면 오답인 경우에 쿼리 3번인데.. => select로 변경?
      _answers = answers.where(value: user_answer)
      _answers = answers.where(type: Model::Answer::Pass) if _answers.empty?
      _answers = answers.where(type: Model::Answer::Fail) if _answers.empty?
      _answers
    # rescue
    #   []
    end

    # TEST용
    def next_stage_lists
      Model::StageList.where(
        id: Model::Branch.joins(answer: { stage_list_type: :stage_list })
          .where("#{table_name}": { id: id })
          .pluck(:target_stage_list_id)
        ).includes(:translations)
    end

    def self.serializer
      Model::Serializer::StageList
    end

    def hints
      stage_list_type.hints
    end

    private
      # Set default stage_list_number
      def set_stage_list_number
        stage_list_number = theme_data.stage_lists.size + 1 if stage_list_number.nil? or stage_list_number == 1
      end
      # Helper methods
      def answers
        stage_list_type.answers
      end
  end
end
