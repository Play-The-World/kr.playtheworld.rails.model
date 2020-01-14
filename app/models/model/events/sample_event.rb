module Model
  class SampleEvent < Model::Event
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
