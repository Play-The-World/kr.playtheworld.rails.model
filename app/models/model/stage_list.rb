module Model
  class StageList < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title, :content
    
    # Relations
    belongs_to :theme
    has_many :stages, class_name: "Model::Stages::Stage", dependent: :destroy
    has_one :stage_list_type, dependent: :destroy

    # Scopes
    default_scope { includes(:stage_list_type, :stages) }

    def valid?
      stages.last.class == Model::Stages::QuizStage
    rescue ActiveRecord::RecordNotFound => e
      false
    end
  end
end
