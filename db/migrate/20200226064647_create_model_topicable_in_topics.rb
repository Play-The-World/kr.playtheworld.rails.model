class CreateModelTopicableInTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :model_topicable_in_topics do |t|
      # Relations
      t.references :topic, index: false
      t.references :topicable, polymorphic: true, index: false

      t.timestamps

      # Index
      t.index [:topic_id, :topicable_id, :topicable_type], name: "topicables_index", unique: true
    end
  end
end
