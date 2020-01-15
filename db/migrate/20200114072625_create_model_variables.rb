class CreateModelVariables < ActiveRecord::Migration[6.0]
  def change
    create_table :model_variables do |t|
      # Relataions
      t.references :object, polymorphic: true

      # Attributes
      t.string :type
      t.string :name
      t.text :value

      t.timestamps

      # Indexes
      t.index [:object_id, :object_type, :name], name: "variable_index", unique: true
    end
  end
end
