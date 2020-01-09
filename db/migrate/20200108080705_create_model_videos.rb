class CreateModelVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :model_videos do |t|
      # Relations
      t.references :videoable, polymorphic: true

      # Attributes
      t.string :video_type

      t.timestamps

      # Indexes
      t.index :video_type
    end
  end
end
