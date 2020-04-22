class CreateModelSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :model_settings do |t|
      # Relations
      t.references :settingable, polymorphic: true, index: false

      # Attributes
      t.string :title
      t.integer :topics_count, default: 0
      
      t.timestamps

      # Indexes
      t.index [:settingable_id, :settingable_type, :title], name: "settings_index"
    end
  end
end
