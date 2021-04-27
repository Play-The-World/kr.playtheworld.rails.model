class CreateModelVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :model_videos do |t|
      # Relations
      t.references :videoable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :store_type
      t.string :value
      t.integer :order, default: 1

      t.timestamps

      # Indexes
      t.index [:videoable_type, :videoable_id, :type, :order], name: "videos_index", unique: true
    end
  end
end
