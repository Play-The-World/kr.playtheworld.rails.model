class CreateModelVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :model_videos do |t|
      # Relations
      t.references :videoable, polymorphic: true

      # Attributes
      t.string :video_type
      t.integer :order, default: 1

      t.timestamps

      # Indexes
      t.index [:videoable_id, :videoable_type, :video_type, :order], name: "videoable_index", unique: true
    end
  end
end
