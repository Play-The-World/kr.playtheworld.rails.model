module Model
  module HasAchievement
    extend ActiveSupport::Concern

    included do
      has_many :achievements, as: :object, dependent: :destroy
    end
  end
end