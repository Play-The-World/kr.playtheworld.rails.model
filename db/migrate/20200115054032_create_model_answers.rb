class CreateModelAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_answers do |t|

      t.timestamps
    end
  end
end
