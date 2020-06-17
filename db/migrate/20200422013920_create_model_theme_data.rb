class CreateModelThemeData < ActiveRecord::Migration[6.0]
  def change
    create_table :model_theme_data do |t|
      # Relations
      t.references :theme, index: false

      # Attributes
      t.integer :version, default: 1, null: false
      t.integer :start_stage_list_number, default: 1
      t.string :memo

      t.timestamps

      # Indexes
      t.index [:theme_id, :version]
    end
  end
end
