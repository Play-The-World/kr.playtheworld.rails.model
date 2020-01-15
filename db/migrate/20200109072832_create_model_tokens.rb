class CreateModelTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :model_tokens do |t|
      # Relations
      t.references :tokenable

      # Attributes
      t.string :status
      t.string :type
      t.string :value, default: "", null: false
      t.datetime :revoked_at

      t.timestamps

      # Indexes
      t.index [:status, :value]
      t.index :type
    end
  end
end
