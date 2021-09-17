class CreateModelClues < ActiveRecord::Migration[6.1]
  def change
    create_table :model_clues do |t|
      # Relations
      t.references :super_theme
      t.references :clueable, polymorphic: true

      # Attributes
      t.boolean :default, default: true
      t.integer :level, default: 1
      t.integer :phase, default: 1
      t.integer :chance, default: 1
      t.boolean :unique, default: false

      t.string :type

      t.string :title
      t.string :location
      t.text :content
      t.text :hint

      t.timestamps
    end

    # reversible do |dir|
    #   dir.up do
    #     Model::Clue::Base.create_translation_table!({
    #       title: :string, location: :string, content: :text, hint: :text
    #     })
    #   end

    #   dir.down do
    #     Model::Clue::Base.drop_translation_table!
    #   end
    # end
  end
end
