class CreateModelSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :model_settings do |t|
      # Relations
      t.references :settingable, polymorphic: true

      # Attributes
      t.string :title
      t.integer :topics_count, default: 0
      
      t.timestamps
    end
  end
end
