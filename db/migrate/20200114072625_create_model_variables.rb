class CreateModelVariables < ActiveRecord::Migration[6.0]
  def change
    create_table :model_variables do |t|
      # Relataions
      t.references :object, polymorphic: true, index: false

      # Attributes
      t.string :name
      t.text :value

      t.timestamps

      # Indexes
      t.index [:object_type, :object_id, :name], name: "variable_index", unique: true
    end
  end
end
