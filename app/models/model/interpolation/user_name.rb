module Model::Interpolation
  class UserName < Base
    def marker
      "%{user_name}"
    end
    def result(ref = nil)
      Model::Current.user.name
    rescue
      super(ref)
    end
  end
end