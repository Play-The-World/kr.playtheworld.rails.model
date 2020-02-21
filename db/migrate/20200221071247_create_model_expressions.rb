class CreateModelExpressions < ActiveRecord::Migration[6.0]
  def change
    create_table :model_expressions do |t|
      # Relations
      t.references :expression_type
      t.references :expresser, polymorphic: true

      # Attributes
      t.string :type

      t.timestamps

      # Indexes
      t.index :type
    end
  end
end
