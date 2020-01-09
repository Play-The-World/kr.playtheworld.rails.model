class CreateModelStages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stages do |t|
      # Relations
      t.references :model_stage

      # Attributes
      t.string :stage_type

      t.timestamps
    end

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
