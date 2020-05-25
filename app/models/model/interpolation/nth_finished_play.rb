module Model::Interpolation
  class NthFinishedPlay < Base
    def marker
      "%{nth_play}"
    end
    def result(ref = nil)
      "#{target.plays.finished.pluck(:id).index(ref.id) + 1}"
    rescue
      super(ref)
    end
  end
end