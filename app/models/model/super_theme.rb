module Model
  class SuperTheme < ApplicationRecord
    include Model::Translatable
    translates :title, :summary, :content
  end
end
