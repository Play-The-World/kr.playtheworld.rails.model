module Model::Event
  class Sample < Base
    def triggerable?
      super
      # just use super or code here if you have specific conditions
    end

    def trigger
      super
      # do something
      # ...
    end
  end
end
