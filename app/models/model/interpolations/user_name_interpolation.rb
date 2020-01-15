module Model::Interpolations
  class UserNameInterpolation < Interpolation
    def target
      "%{}"
    end
    def result
      Model::Current.user ? Model::Current.user.name : super
    end
  end
end