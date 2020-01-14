class CreateModelAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :model_audios do |t|
      # Relations
      t.references :audioable, polymorphic: true

      # Attributes
      t.string :audio_type
      t.integer :order, default: 1

      t.timestamps

      # Indexes
      t.index [:audioable, :audio_type, :order], unique: true
    end
  end
end
