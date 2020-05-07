module Model
  class StageListType < ApplicationRecord
    # Relations
    belongs_to :stage_list
    has_many :answers, class_name: Model.config.answer.class_name, dependent: :destroy
    has_many :hints, dependent: :destroy
    include Model::Coordinatable
    include Model::Imageable

    # Game Component
    GAME_COMPONENT = Model::GameComponent
    serialize :game_component, GAME_COMPONENT::Base 

    def self.game_component(of:)
      "#{GAME_COMPONENT.to_s}::#{of.to_s.camelize}".constantize rescue nil
    end
    
    def self.game_components
      GAME_COMPONENT.constants.select { |k| GAME_COMPONENT.const_get(k).instance_of? Class } - [:Base]
    end

    def self.serializer
      Model::Serializer::StageListType
    end
  end
end
