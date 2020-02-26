class CreateModelTopicLists < ActiveRecord::Migration[6.0]
  def change
    create_table :model_topic_lists do |t|
      # Relations
      t.references :application

      t.timestamps
    end
  end
end
