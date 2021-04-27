class CreateModelImages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_images do |t|
      # Relations
      t.references :imageable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :store_type
      t.string :value
      t.integer :order, default: 1
      
      t.timestamps

      # Indexes
      # https://stackoverflow.com/a/42242003
      # type을 먼저 indexing
      # https://use-the-index-luke.com/sql/dml/insert
      # Index를 최소화 할 것
      t.index [:imageable_type, :imageable_id, :type, :order], name: "images_index"#, unique: true
    end
  end
end
