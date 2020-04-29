module Model
  module Classifiable
    extend ActiveSupport::Concern

    included do
      has_many :classifications, as: :classifiable, dependent: :destroy
      has_many :classifier, through: :classifications
      
      has_many :locations, through: :classifications, source: :classifier, source_type: Model::Location.to_s
      has_many :genres, through: :classifications, source: :classifier, source_type: Model::Genre.to_s
      has_many :categories, through: :classifications, source: :classifier, source_type: Model::Category.to_s
    end
  end
end