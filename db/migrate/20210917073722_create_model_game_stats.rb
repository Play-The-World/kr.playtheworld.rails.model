class CreateModelGameStats < ActiveRecord::Migration[6.1]
  def change
    create_table :model_game_stats do |t|
      # Relations
      t.references :game_statsable, polymorphic: true

      # Attributes
      t.string :type
      t.string :value
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
