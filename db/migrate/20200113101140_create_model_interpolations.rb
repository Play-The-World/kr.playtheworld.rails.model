class CreateModelInterpolations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_interpolations do |t|
      # Relations
      t.references :interpolatable, polymorphic: true, index: { name: "interpolation_index" }

      # Attributes
      t.string :type

      t.timestamps

      # Indexes
      t.index [:interpolatable_id, :interpolatable_type, :type], name: "interpolation_type_index", unique: true
    end
  end
end
