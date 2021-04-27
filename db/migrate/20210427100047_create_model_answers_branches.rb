class CreateModelAnswersBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :model_answers_branches do |t|
      # Relations
      t.references :answer
      t.references :branch

      t.timestamps
    end
  end
end
