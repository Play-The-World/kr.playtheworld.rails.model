class CreateModelVariables < ActiveRecord::Migration[6.0]
  def change
    create_table :model_variables do |t|
      # Relataions
      t.references :object, polymorphic: true

      # Attributes
      t.string :variable_type, null: false
      t.string :name
      t.text :value

      t.timestamps

      # Indexes
      t.index [:object, :variable_type], unique: true
    end
  end
end
