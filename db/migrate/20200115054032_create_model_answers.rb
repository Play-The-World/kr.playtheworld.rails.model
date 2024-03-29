class CreateModelAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_answers do |t|
      # Relations
      t.references :stage_list_type

      # Attirbutes
      t.string :type
      t.string :value
      t.boolean :ordered, default: false
      t.boolean :case_sensitive, default: false

      t.timestamps

      # Indexes
      t.index [:stage_list_type_id, :type], name: "answer_index1"
      t.index [:stage_list_type_id, :value], name: "answer_index2"
    end
  end
end
