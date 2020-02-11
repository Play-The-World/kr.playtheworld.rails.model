module Model
  class StageList < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title, :content
    
    # Relations
    belongs_to :theme
    has_many :stages, class_name: Model.config.stage.class_name, dependent: :destroy
    has_one :stage_list_type, dependent: :destroy

    # Scopes
    default_scope { includes(stage_list_type: [:answers], stages: []) }

    # 유효성 검사 => Bool
    def valid?
      # 가장 마지막 스테이지가 Quiz or End 스테이지인지 검사
      stages.last.is_a?(Model::Stage::Quiz) or stages.last.is_a?(Model::Stage::End)
    rescue # ActiveRecord::RecordNotFound => e
      false
    end

    # 해당하는 Answer를 찾음 => Answer?
    def answer(user_answer = nil)
      _answer = answers.where(value: user_answer).or.where(answer_type: :pass).take
      _answer ||= answers.find_by(answer_type: :failure)
      _answer
    rescue
      nil
    end

    private
      # Helper methods
      def answers
        stage_list_type.answers
      end
  end
end
