class CreateModelLinkUsages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_link_usages do |t|
      # Relations
      t.references :link
      t.references :link_user, polymorphic: true

      # Attributes
      
      t.timestamps
    end
  end
end
