class CreateModelVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :model_videos do |t|
      t.references :videoable, polymorphic: true

      t.timestamps
    end
  end
end
