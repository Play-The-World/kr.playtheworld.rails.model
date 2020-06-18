module Model
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    # Targetable
    has_many :target_events, as: :target, class_name: Model.config.event.class_name, dependent: :nullify
    has_many :target_interpolations, as: :target, class_name: Model.config.interpolation.class_name, dependent: :nullify

    def table_name
      self.class.table_name
    end

    def as_json(view = nil)
      serializer.render_as_hash(self, view: view)
    rescue
      serializer.render_as_hash(self)
    end

    def repo; self.class.repo end
    def serializer; self.class.serializer end

    class << self
      def repo
        Model::Repository::Base.new(self)
      end
      def serializer
        Model::Serializer::Base
      end
    end
  end
end
