class CreateModelPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :model_posts do |t|
      # Relations
      t.references :board, index: false

      # Attirbutes
      t.string :title
      t.text :content
      t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index [:board_id, :type]
      t.index [:board_id, :status]
    end

    # reversible do |dir|
    #   dir.up do
    #     Model.config.post.constant.create_translation_table!({
    #       title: :string, content: :text
    #     })
    #   end

    #   dir.down do
    #     Model.config.post.constant.drop_translation_table!
    #   end
    # end
  end
end
