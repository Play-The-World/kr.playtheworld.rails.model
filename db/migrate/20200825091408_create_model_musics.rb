class CreateModelMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :model_musics do |t|
      # Relations
      t.references :musicable, polymorphic: true
      t.references :audio
      # t.references :start_stage_list
      # t.references :end_stage_list

      # Attributes
      t.string :type

      t.timestamps
    end
  end
end
