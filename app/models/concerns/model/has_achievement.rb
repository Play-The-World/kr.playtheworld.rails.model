module Model
  module HasAchievement
    extend ActiveSupport::Concern

    included do
      has_many :achievements, as: :object, class_name: Model.config.achievement.class_name, dependent: :destroy
    end
  end
end