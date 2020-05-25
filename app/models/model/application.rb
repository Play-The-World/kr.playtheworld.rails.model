module Model
  class Application < ApplicationRecord
    # Relations
    include Model::HasSetting
    include Model::HasVariables
    include Model::Textable
    include Model::Eventable
    include Model::Conditioner

    # Enums
    extend Enumerize
    enumerize :mode, in: %i(test development production), default: :development

    class << self
      def current
        self.find_or_create_by(mode: :development)
      end
    end
  end
end
