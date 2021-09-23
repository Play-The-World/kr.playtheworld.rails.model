module Model
  class ArrayHashSerializer
    def self.dump(array)
      array.to_json
    end

    def self.load(array)
      if array.is_a?(String)
        JSON.parse(array).map(&:with_indifferent_access)
      else
        (array || []).map(&:with_indifferent_access)
      end
    end
  end
end