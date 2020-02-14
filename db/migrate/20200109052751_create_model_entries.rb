class CreateModelEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_entries do |t|
      # Relations
      t.references :users
      t.references :teams

      t.timestamps
    end
  end
end
