class CreateModelViewTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_view_types do |t|
      # Relations
      t.references :viewable, polymorphic: true

      # Attirbutes
      t.string :type
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
