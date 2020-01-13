class CreateModelInterpolations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_interpolations do |t|
      # Relations
      t.references :interpolatable, polymorphic: true

      # Attributes
      t.string :value_type

      t.timestamps
    end
  end
end
