class CreateModelStageLists < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stage_lists do |t|
      # Relations
      t.references :theme

      t.timestamps

      reversible do |dir|
        dir.up do
          Model::Stage.create_translation_table!({
            title: :string, content: :text
          })
        end
  
        dir.down do
          Model::Stage.drop_translation_table!
        end
      end
    end
  end
end
