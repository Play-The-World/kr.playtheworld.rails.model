class CreateModelSuperThemeInTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :model_super_theme_in_topics do |t|
      # Relations
      t.references :topic
      t.references :super_theme

      t.timestamps
    end
  end
end
