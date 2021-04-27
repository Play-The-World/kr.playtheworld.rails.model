module Model::Play
  class Finished < Base
    # Ranks
    has_one :rank, as: :record, dependent: :destroy

    # Callbacks
    after_create :create_rank

    # Validations
    validates :finished_at,
      presence: { message: "Finished_at must be set" }

    # TODO 랭크 기록
    def create_rank
      # ranks.create()
    end

    def finished?; true end
  end
end