class CreateModelMakers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_makers do |t|
      # Relations
      t.references :user, index: false

      # Attributes
      t.string :name#, null: false
      t.text :content
      t.string :status

      t.timestamps

      # Indexes
      t.index :name#, unique: true
      t.index :user_id, unique: true
    end

    # reversible do |dir|
    #   dir.up do
    #     Model::Maker.create_translation_table!({
    #       name: :string, content: :text
    #     })
    #   end

    #   dir.down do
    #     Model::Maker.drop_translation_table!
    #   end
    # end
  end
end
