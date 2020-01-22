class CreateModelBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :model_boards do |t|
      # Relations
      t.references :boardable, polymorphic: true

      # Attributes
      t.string :type
      t.integer :posts_count, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Model.config.board.constant.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model.config.board.constant.drop_translation_table!
      end
    end
  end
end
