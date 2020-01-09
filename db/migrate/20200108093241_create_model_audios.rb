class CreateModelAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :model_audios do |t|
      # Relations
      t.references :audioable, polymorphic: true

      # Attributes
      t.string :audio_type

      t.timestamps

      # Indexes
      t.index :audio_type
    end
  end
end
