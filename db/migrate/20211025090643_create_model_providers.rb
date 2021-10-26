class CreateModelProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :model_providers do |t|
      # Relations
      t.references :user

      # Attributes
      t.string :type
      t.string :name
      t.string :uid
      t.string :access_token
      t.string :refresh_token

      t.timestamps

      # Indexes
      t.index [:type, :name, :uid], unique: true
      t.index :uid
    end
  end
end
