class CreateModelPlays < ActiveRecord::Migration[6.0]
  def change
    create_table :model_plays do |t|
      # Relations
      t.references :user
      t.references :super_play
      t.references :theme_data

      # Attirbutes
      t.integer :stage_list_index, default: 0, null: false
      t.integer :stage_index, default: 0, null: false
      t.string :status
      t.string :type
      t.datetime :finished_at

      t.timestamps

      # Indexes
      t.index :type
      # Index 추가하기
    end
  end
end
