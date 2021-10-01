module Model
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    # 테스트 시에 사용
    connects_to database: { writing: :new_model, reading: :new_model }

    # Targetable
    has_many :target_events, as: :target, class_name: Model.config.event.class_name, dependent: :nullify
    has_many :target_interpolations, as: :target, class_name: Model.config.interpolation.class_name, dependent: :nullify

    def table_name
      self.class.table_name
    end

    def as_json(view = :base)
      view = :base if view == {}
      serializer.render_as_hash(self, view: view)
    # TODO: production에서만 활성화 하기.
    # rescue
    #   serializer.render_as_hash(self)
    end

    def pusher(event:, params:)
      raise "You must set channel_name first" if channel_name.nil?

      Model::Pusher.trigger(channel_name, event.to_s, params)
    end
    def channel_name; nil end

    def repo; self.class.repo end
    def serializer; self.class.serializer end

    class << self
      def repo
        Model::Repository::Base.new(self)
      end
      def serializer
        names = name.split("::")
        # s_name = names[-1] == "Base" ? names[-2] : names[-1]
        s_name = names.size >= 3 ? names[-2] : names[-1]
        "Model::Serializer::#{s_name}".constantize
      rescue
        Model::Serializer::Base
      end
    end
  end
end
