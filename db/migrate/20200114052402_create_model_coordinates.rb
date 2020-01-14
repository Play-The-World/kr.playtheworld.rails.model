class CreateModelCoordinates < ActiveRecord::Migration[6.0]
  def change
    create_table :model_coordinates do |t|
      # Relations
      t.references :coordinatable, polymorphic: true

      # Attirbutes
      t.string :coordinate_type
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
