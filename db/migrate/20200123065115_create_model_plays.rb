class CreateModelPlays < ActiveRecord::Migration[6.0]
  def change
    create_table :model_plays do |t|
      # Relations
      t.references :model_super_play

      # Attirbutes
      t.string :status
      t.string :type

      t.timestamps

      # Indexes
      t.index :type
    end
  end
end
