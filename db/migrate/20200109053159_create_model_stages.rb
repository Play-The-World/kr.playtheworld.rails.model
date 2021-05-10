class CreateModelStages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stages do |t|
      # Relations
      t.references :stage_list, index: false

      # Attributes
      t.string :type
      # t.string :stage_type
      # t.integer :stage_number, default: 0 # 이전 버전과 호환을 위해
      t.integer :order, null: false, default: 1

      t.timestamps

      # Indexes
      t.index [:type, :order]
      t.index [:stage_list_id, :order, :type]#, unique: true
    end

    # 혹시 몰라 title 냅둠
    reversible do |dir|
      dir.up do
        Model.config.stage.constant.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model.config.stage.constant.drop_translation_table!
      end
    end
  end
end
