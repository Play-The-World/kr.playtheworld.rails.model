class CreateModelAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_answers do |t|
      # Relations
      t.references :stage_list, index: false

      # Attirbutes
      t.string :type
      t.string :value_type
      t.string :value
      t.string :content
      t.boolean :ordered, default: false
      t.boolean :case_sensitive, default: false

      t.timestamps

      # Indexes
      t.index :type
      t.index [:stage_list_id, :type], name: "answer_index1"
    end
  end
end
