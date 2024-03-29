module Model
  module Classifier
    extend ActiveSupport::Concern

    included do
      has_many :classifications, as: :classifier, dependent: :destroy
      has_many :objects, through: :classifications

      has_many :super_themes, through: :classifications, source: :classifiable, source_type: Model::SuperTheme::Base.to_s
    end
  end
end