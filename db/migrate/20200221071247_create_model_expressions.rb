class CreateModelExpressions < ActiveRecord::Migration[6.0]
  def change
    create_table :model_expressions do |t|
      # Relations
      t.references :expression_type, index: false
      t.references :expresser, polymorphic: true, index: false

      # Attributes
      t.string :type

      t.timestamps

      # Indexes
      t.index [:expression_type_id, :type]
      t.index [:expresser_id, :expresser_type, :type], name: "expressions_index"
    end
  end
end
