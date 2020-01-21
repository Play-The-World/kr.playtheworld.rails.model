class CreateModelViews < ActiveRecord::Migration[6.0]
  def change
    create_table :model_views do |t|

      t.timestamps
    end
  end
end
