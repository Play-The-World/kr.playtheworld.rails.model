module Model
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    # Repository
    def self.repo
      Model::Repository::Base.new(self)
    end
    def repo; self.class.repo end

    # Serializer
    def self.serializer
      Model::Serializer::Base
    end
    def serializer
      self.class.serializer
    end
    def as_json(options = {})
      serializer.new(self).serializable_hash
    end

    def nothing; end
  end
end
