module Model
  class CharacterInTheme < ApplicationRecord
    # Relations
    belongs_to :character, class_name: Model.config.character.class_name
    # belongs_to :theme, class_name: Model.config.theme.class_name
    belongs_to :theme_data
  end
end
