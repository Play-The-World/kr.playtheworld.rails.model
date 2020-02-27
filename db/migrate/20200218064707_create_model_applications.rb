class CreateModelApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :model_applications do |t|
      # Attributes
      t.string :mode
      # t.string :title, null: false, default: "default"

      t.timestamps

      # Indexes
      t.index :mode, unique: true
      # t.index [:mode, :title], unique: true
    end
  end
end
