class CreateModelCoordinates < ActiveRecord::Migration[6.0]
  def change
    create_table :model_coordinates do |t|
      # Relations
      t.references :coordinatable, polymorphic: true, index: { name: "coordinate_index" }

      # Attirbutes
      t.string :type
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
