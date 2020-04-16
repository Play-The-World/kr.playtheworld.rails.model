module Model::Play
  class Finished < Base
    # Ranks
    include Model::Rankable

    # Callbacks
    after_create :create_rank

    # Validations
    validates :finished_at,
      presence: { message: "Finished_at must be set" }

    # TODO 랭크 기록
    def create_rank
      ranks.create()
    end
  end
end