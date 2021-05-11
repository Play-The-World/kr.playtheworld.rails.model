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
    has_many :target_branches, dependent: :destroy, foreign_key: 'target_stage_list_id'
    has_many :tracks, dependent: :destroy
    has_many :plays, through: :tracks, class_name: Model.config.play.class_name
    include Model::Conditioner
    has_many :answers, through: :stage_list_type, class_name: Model.config.answer.class_name
    has_many :hints, through: :stage_list_type
    has_many :branches, through: :stage_list_type
    has_many :target_stage_lists, through: :branches, class_name: self.to_s
    alias_attribute :next_stage_lists, :target_stage_lists

    # Scopes
    # default_scope { includes(stage_list_type: [:answers, :hints, :coordinate], stages: []) }

    # Callbacks
    before_create :set_number
    after_create :create_stage_list_type

    # Enumerize
    extend Enumerize
    enumerize :type, in: %i(default end fail), default: :default

    # Delegation
    # delegate :hints,
    #          :answers,
    #          :branches,
    #          to: :stage_list_type

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

    def get_answer!
      _answer = answers.where(type: [Model::Answer::Correct, Model::Answer::Pass]).take
      _answer ||= answers.take
      _answer
    end

    # TEST용
    # def next_stage_lists
    #   # Model::StageList.where(
    #   #   id: Model::Branch.joins(answers: { stage_list_type: :stage_list })
    #   #     .where("#{table_name}": { id: id })
    #   #     .pluck(:target_stage_list_id)
    #   #     .uniq
    #   #   ).includes(:translations)
    #   branches.includes(:target_stage_list).map(&:target_stage_list).uniq
    # end

    def self.serializer
      Model::Serializer::StageList
    end

    private
      # Set default number
      def set_number
        number = theme_data.stage_lists.size + 1 if number.nil? or number == 1
      end
  end
end
