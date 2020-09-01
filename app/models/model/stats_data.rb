module Model
  module StatsData
    def self.types
      self.constants.select { |k| self.const_get(k).instance_of? Class } - [:Base]
    end
  end
end