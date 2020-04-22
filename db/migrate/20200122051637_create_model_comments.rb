class CreateModelComments < ActiveRecord::Migration[6.0]
  def change
    create_table :model_comments do |t|
      # Relations
      t.references :commentable, polymorphic: true, index: false
      t.references :commenter, polymorphic: true
      t.references :board

      # Attributes
      t.string :title
      t.text :content
      t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index [:commentable_id, :commentable_type, :type], name: "comments_index"
    end
  end
end
