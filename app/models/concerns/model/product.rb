module Model
  module Product
    extend ActiveSupport::Concern

    included do
      has_many :creations, as: :product, dependent: :destroy
      has_many :makers, through: :creation, source: :creator, source_type: Model::Maker.to_s
      has_many :maker_teams, through: :creation, source: :creator, source_type: Model::MakerTeam.to_s

      # def creator
      #   maker || maker_team
      # end
    end
  end
end
