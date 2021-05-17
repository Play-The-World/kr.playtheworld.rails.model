module Model
  class ExpressionType < ApplicationRecord
    # Relations
    belongs_to :expressable, polymorphic: true
    has_many :expressions, class_name: Model.config.expression.class_name, dependent: :destroy

    def liked?(type = Model::Expression::Like)
      expressions.where(type: type, expresser: Model.current.user).exists?
    end
  end
end
