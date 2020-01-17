module Model::Interpolation
  class UserName < Base
    def target
      "%{}"
    end
    def result
      Model::Current.user ? Model::Current.user.name : super
    end
  end
end