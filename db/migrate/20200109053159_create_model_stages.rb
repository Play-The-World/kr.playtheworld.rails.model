class CreateModelStages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stages do |t|
      # Relations
      t.references :model_stage, index: false

      # Attributes
      t.string :type
      t.integer :order, null: false, default: 1

      t.timestamps

      # Indexes
      t.index [:model_stage_id, :order], unique: true
    end

    reversible do |dir|
      dir.up do
        Model::Stages::Stage.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model::Stages::Stage.drop_translation_table!
      end
    end
  end
end
