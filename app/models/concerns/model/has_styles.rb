module Model
  module HasStyles
    extend ActiveSupport::Concern

    included do
      has_many :styles, as: :styleable, dependent: :destroy
    end
  end
end