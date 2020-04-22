class CreateModelThemeData < ActiveRecord::Migration[6.0]
  def change
    create_table :model_theme_data do |t|
      # Relations
      t.references :theme, index: false

      # Attributes
      t.integer :version, default: 1, null: false

      t.timestamps

      # Indexes
      t.index [:theme_id, :version]
    end
  end
end
