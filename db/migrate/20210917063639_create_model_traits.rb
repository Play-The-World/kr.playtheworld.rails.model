class CreateModelTraits < ActiveRecord::Migration[6.1]
  def change
    create_table :model_traits do |t|
      # Relations
      t.references :super_theme

      # Attributes
      t.string :title
      t.string :content
      t.boolean :default, default: true

      t.timestamps
    end
  end
end
