class CreateModelViews < ActiveRecord::Migration[6.0]
  def change
    create_table :model_views do |t|
      # Relations
      t.references :viewable, polymorphic: true
      t.references :viewer, polymorphic: true

      t.timestamps
    end
  end
end
