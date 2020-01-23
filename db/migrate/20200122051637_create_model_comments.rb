class CreateModelComments < ActiveRecord::Migration[6.0]
  def change
    create_table :model_comments do |t|
      # Relations
      t.references :commentable, polymorphic: true
      t.references :commenter, polymorphic: true
      t.references :model_board

      # Attributes
      t.string :title
      t.text :content
      t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index :type
      t.index :status
    end
  end
end
