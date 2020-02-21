module Model
  class ExpressionType < ApplicationRecord
    # Relations
    belongs_to :expressable, polymorphic: true
    has_many :expressions, class_name: Model.config.expression.class_name, dependent: :destroy
  end
end
