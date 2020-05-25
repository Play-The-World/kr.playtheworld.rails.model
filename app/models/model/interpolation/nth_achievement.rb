module Model::Interpolation
  class NthAchievement < Base
    def marker
      "%{nth}"
    end
    def result(ref = nil)
      "#{target.users.pluck(:id).index(Model.current.user.id) + 1}"
    rescue
      super(ref)
    end
  end
end