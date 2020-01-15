module Model::Events
  class SampleEvent < Event
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
