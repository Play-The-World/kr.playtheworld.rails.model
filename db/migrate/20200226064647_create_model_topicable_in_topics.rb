class CreateModelTopicableInTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :model_topicable_in_topics do |t|
      # Relations
      t.references :topic, index: false
      t.references :topicable, polymorphic: true, index: { name: "topicables_index1" }

      t.timestamps

      # Index
      t.index [:topic_id, :topicable_type, :topicable_id], name: "topicables_index2", unique: true
    end
  end
end
