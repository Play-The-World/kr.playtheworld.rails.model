class CreateModelInterpolations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_interpolations do |t|
      # Relations
      t.references :interpolatable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :target_value

      t.timestamps

      # Indexes
      t.index [:interpolatable_id, :interpolatable_type, :target_value], name: "interpolations_index", unique: true
    end
  end
end
