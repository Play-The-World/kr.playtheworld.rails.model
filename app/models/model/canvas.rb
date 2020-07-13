module Model
  class Canvas < ApplicationRecord
    # Relations
    belongs_to :stage, class_name: Model.config.stage.class_name
  end
end
