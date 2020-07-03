module Model
  module Creator
    extend ActiveSupport::Concern

    included do
      has_many :creations, as: :creator, dependent: :destroy
      has_many :themes,
        through: :creation,
        source: :product,
        source_type: Model::Theme::Base.to_s
      has_many :super_themes,
        through: :creation,
        source: :product,
        source_type: Model::SuperTheme::Base.to_s
    end
  end
end