class CreateModelCoordinates < ActiveRecord::Migration[6.0]
  def change
    create_table :model_coordinates do |t|
      # Relations
      t.references :coordinatable, polymorphic: true, index: false

      # Attirbutes
      t.string :type
      t.float :x
      t.float :y

      t.timestamps

      # Indexes
      t.index [:coordinatable_id, :coordinatable_type, :type], name: "coordinates_index"
    end
  end
end
