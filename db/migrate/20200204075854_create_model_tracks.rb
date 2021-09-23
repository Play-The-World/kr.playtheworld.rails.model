class CreateModelTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :model_tracks do |t|
      # Relations
      t.references :play
      t.references :stage_list

      t.integer :value1, default: 0
      t.integer :value2, default: 0
      t.integer :wrong_answer_count, default: 0
      t.integer :used_hint_count, default: 0
      t.integer :used_answer_count, default: 0

      t.timestamps
    end
  end
end
