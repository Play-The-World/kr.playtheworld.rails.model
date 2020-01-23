class CreateModelPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :model_posts do |t|
      # Relations
      t.references :model_board

      # Attirbutes
      t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index :type
      t.index :status
    end

    reversible do |dir|
      dir.up do
        Model.config.post.constant.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model.config.post.constant.drop_translation_table!
      end
    end
  end
end
