class CreateModelCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :model_categories do |t|
      # Attributes
      t.string :type

      t.timestamps
      
      # Indexes
      t.index :type, unique: true
    end

    reversible do |dir|
      dir.up do
        Model::Category.create_translation_table!({
          title: :string
        })
      end

      dir.down do
        Model::Category.drop_translation_table!
      end
    end
  end
end
