module Model
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    # Targetable
    has_many :target_events, as: :target, class_name: Model.config.event.class_name, dependent: :nullify
    has_many :target_interpolations, as: :target, class_name: Model.config.interpolation.class_name, dependent: :nullify

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

    def table_name
      self.class.table_name
    end
  end
end
