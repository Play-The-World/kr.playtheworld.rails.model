class CreateModelTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :model_texts do |t|
      t.references :textable, polymorphic: true

      t.timestamps
    end
  end
end
