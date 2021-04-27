class CreateModelTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :model_teams do |t|
      # Attributes
      t.string :status
      t.string :type
      t.string :name
      t.text :content
      t.integer :super_plays_count, default: 0
      
      t.timestamps

      # Indexes
      # t.index [:type, :status]
      t.index [:type, :name]
      t.index :name
    end

    # reversible do |dir|
    #   dir.up do
    #     Model::Team.create_translation_table!({
    #       name: :string, content: :text
    #     })
    #   end

    #   dir.down do
    #     Model::Team.drop_translation_table!
    #   end
    # end
  end
end
