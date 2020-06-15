class CreateModelStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :model_styles do |t|

      t.timestamps
    end
  end
end
