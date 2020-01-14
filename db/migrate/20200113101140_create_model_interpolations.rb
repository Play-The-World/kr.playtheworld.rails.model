class CreateModelInterpolations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_interpolations do |t|
      # Relations
      t.references :interpolatable, polymorphic: true

      # Attributes
      t.string :interpolation_type

      t.timestamps

      # Indexes
      t.index [:interpolatable, :interpolation_type], unique: true
    end
  end
end
