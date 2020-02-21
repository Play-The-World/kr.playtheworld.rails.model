class CreateModelStages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stages do |t|
      # Relations
      t.references :stage_list, index: false

      # Attributes
      t.string :type
      t.integer :stage_number, default: 0 # 이전 버전과 호환을 위해
      t.integer :order, null: false, default: 1

      t.timestamps

      # Indexes
      t.index [:stage_list_id, :order], unique: true
    end

    reversible do |dir|
      dir.up do
        Model.config.stage.constant.create_translation_table!({
          content: :text
        })
      end

      dir.down do
        Model.config.stage.constant.drop_translation_table!
      end
    end
  end
end
