module Model::GameComponent
  class LockDial1 < Base
    def types=(values = [])
      @options[:types] = values
    end
    def types
      @options[:types] || []
    end    
  end
end