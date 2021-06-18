module Model
  module StageList

    # Game Component
    GAME_COMPONENT = ::Model::GameComponent

    def self.game_component(of:)
      "#{GAME_COMPONENT.to_s}::#{of.to_s.camelize}".constantize rescue nil
    end
    
    def self.game_components
      GAME_COMPONENT.constants.select { |k| GAME_COMPONENT.const_get(k).instance_of? Class } - [:Base]
    end

    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.stage_list.table_name

      # Translations
      include Model::Translatable
      translates :title
      
      # Relations
      belongs_to :theme_data
      # has_many :stages, -> { order(order: :asc) }, dependent: :destroy
      has_many :stages, dependent: :destroy, foreign_key: "stage_list_id"
      has_many :tracks, dependent: :destroy, foreign_key: "stage_list_id"
      has_many :plays, through: :tracks, class_name: Model.config.play.class_name
      include Model::Conditioner
      has_many :answers, class_name: Model.config.answer.class_name, dependent: :destroy, foreign_key: "stage_list_id"
      has_many :hints, dependent: :destroy, foreign_key: "stage_list_id"
      has_many :branches, dependent: :destroy, foreign_key: "stage_list_id"
      has_many :target_branches, dependent: :destroy, foreign_key: 'target_stage_list_id'
      has_many :target_stage_lists, through: :branches, class_name: Model.config.stage_list.class_name
      alias_attribute :next_stage_lists, :target_stage_lists
      include Model::Coordinatable
      include Model::Imageable
      include Model::Textable

      # Serialize
      serialize :game_component, GAME_COMPONENT::Base 

      # Callbacks
      before_create :set_number

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
end