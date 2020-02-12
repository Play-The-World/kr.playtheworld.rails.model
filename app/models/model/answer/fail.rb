module Model::Answer
  class Fail < Base
    def wrong?; true end
  end
end