module Model::Interpolation
  class NthPlay < Base
    def target
      "%{nth_play}"
    end
    def result
      Model::Current.theme ? Model::Current.theme.plays.size : super
    end
  end
end