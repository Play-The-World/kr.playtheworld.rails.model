class CreateModelLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :model_links do |t|
      # Relations
      t.references :linkable, polymorphic: true, index: false
      
      # Attributes
      t.string :fake_id
      t.string :type
      t.string :url
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.integer :limit, default: 0
      t.integer :link_usage, default: 0

      t.timestamps

      # Indexes
      t.index :fake_id
      t.index [:linkable_type, :linkable_id, :type], name: "links_index"
    end
  end
end
