class CreateModelAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :model_audios do |t|
      # Relations
      t.references :audioable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :store_type
      t.integer :order, default: 1

      t.timestamps

      # Indexes
      t.index [:audioable_id, :audioable_type, :type, :order], name: "audios_index", unique: true
    end
  end
end
