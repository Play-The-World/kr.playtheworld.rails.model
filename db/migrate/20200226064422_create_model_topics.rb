class CreateModelTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :model_topics do |t|
      # Relations
      # t.references :topic_list

      # Attirbutes
      t.string :type
      
      t.timestamps

      # Indexes
      t.index :type
    end

    reversible do |dir|
      dir.up do
        Model.config.topic.constant.create_translation_table!({
          title: :string
        })
      end

      dir.down do
        Model.config.topic.constant.drop_translation_table!
      end
    end
  end
end
