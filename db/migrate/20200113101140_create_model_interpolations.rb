class CreateModelInterpolations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_interpolations do |t|
      # Relations
      t.references :interpolatable, polymorphic: true, index: false
      t.references :target, polymorphic: true

      # Attributes
      t.string :type
      t.string :marker_value

      t.timestamps

      # Indexes
      t.index [:interpolatable_id, :interpolatable_type, :type], name: "interpolations_index"#, unique: true
    end
  end
end
