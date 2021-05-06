class CreateModelBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :model_branches do |t|
      # Relations
      # t.references :answer#, index: false
      t.references :target_stage_list
      t.references :stage_list_type, index: false

      # Attributes
      t.string :type
      t.boolean :show_alert, null: false, default: true
      t.string :alert_icon
      t.string :alert_title
      t.string :alert_content

      t.timestamps

      # t.index [:answer_id, :type]
      t.index [:stage_list_type_id, :type]
    end
  end
end
