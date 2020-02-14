class CreateModelTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :model_tracks do |t|
      # Relations
      t.references :play
      t.references :stage_list

      t.timestamps
    end
  end
end
