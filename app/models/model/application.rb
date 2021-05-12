module Model
  class Application < ApplicationRecord
    # Relations
    include Model::HasSetting
    include Model::HasVariables
    include Model::Textable
    include Model::Eventable
    include Model::Conditioner
    include Model::HasAchievement

    # Enums
    extend Enumerize
    enumerize :mode, in: %i(test development production), default: :development

    class << self
      def current
        find_or_create_by(mode: Rails.env.to_sym)
      rescue
        first
      end
    end
  end
end
