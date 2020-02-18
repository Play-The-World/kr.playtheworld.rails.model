class CreateModelApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :model_applications do |t|
      # Attributes
      t.string :mode

      t.timestamps

      # Indexes
      t.index :mode, unique: true
    end
  end
end
