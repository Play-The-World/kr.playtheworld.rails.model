module Model
  class Application < ApplicationRecord
    # Relations
    include Model::HasVariables
    include Model::Textable
    include Model::Eventable

    # Enums
    extend Enumerize
    enumerize :mode, in: %i(test development stable), default: :development

    class << self
      def current
        self.find_or_create_by(mode: :development)
      end
    end
  end
end
