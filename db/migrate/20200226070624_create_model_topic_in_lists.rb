class CreateModelTopicInLists < ActiveRecord::Migration[6.0]
  def change
    create_table :model_topic_in_lists do |t|
      # Relations
      t.references :topic
      t.references :topic_list

      # Attributes
      t.integer :order, null: false, default: 1

      t.timestamps

      # Indexes
      t.index [:topic_list_id, :order]#, unique: true
    end
  end
end
