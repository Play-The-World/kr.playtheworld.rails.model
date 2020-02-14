class CreateModelSuperPlays < ActiveRecord::Migration[6.0]
  def change
    create_table :model_super_plays do |t|
      # Relations
      t.references :team
      t.references :super_theme

      # Attirbutes
      t.string :status
      t.string :type
      t.integer :plays_count, default: 0

      t.timestamps

      # Indexes
      t.index :type
    end
  end
end
