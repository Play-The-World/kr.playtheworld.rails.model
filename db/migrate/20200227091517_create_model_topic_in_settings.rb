class CreateModelTopicInSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :model_topic_in_settings do |t|
      # Relations
      t.references :topic
      t.references :setting, index: false

      # Attributes
      t.integer :order, null: false, default: 1

      t.timestamps

      # Indexes
      t.index [:setting_id, :order]#, unique: true
    end
  end
end
