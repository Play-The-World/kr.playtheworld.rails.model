class CreateModelPlainAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :model_plain_audios do |t|
      # Attributes
      t.string :filename
      t.integer :filesize
      t.text :value, limit: 700000

      t.timestamps
    end
  end
end
