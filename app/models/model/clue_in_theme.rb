module Model
  class ClueInTheme < ApplicationRecord
    # Relations
    belongs_to :clue, class_name: Model.config.clue.class_name
    belongs_to :theme, class_name: Model.config.theme.class_name
  end
end
