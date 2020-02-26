module Model
  class SuperThemeInTopic < ApplicationRecord
    # Relations
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name
    belongs_to :topic, class_name: Model.config.topic.class_name
  end
end
