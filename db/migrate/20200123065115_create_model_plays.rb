class CreateModelPlays < ActiveRecord::Migration[6.0]
  def change
    create_table :model_plays do |t|
      # Relations
      t.references :user
      t.references :super_play
      t.references :theme

      # Attirbutes
      t.integer :stage_list_index
      t.integer :stage_index
      t.string :status
      t.string :type
      t.datetime :finished_at

      t.integer :wrong_answer_count, default: 0
      t.integer :used_hint_count, default: 0
      t.integer :used_answer_count, default: 0

      t.timestamps

      # Indexes
      t.index :type
    end
  end
end
