class CreateModelAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_answers do |t|
      # Relations
      t.references :model_stage_list_type

      # Attirbutes
      t.string :type
      t.string :value
      t.boolean :ordered
      t.boolean :case_sensitive

      t.timestamps

      # Indexes
      t.index [:model_stage_list_type_id, :type, :value], name: "answer_index", unique: true
    end
  end
end
