class CreateModelTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :model_tokens do |t|
      # Relations
      t.references :tokenable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :value, default: "", null: false
      t.datetime :expired_at

      t.timestamps

      # Indexes
      # t.index :value
      t.index [:type, :value]
      t.index [:tokenable_type, :tokenable_id, :type, :value], name: "tokens_index"
    end
  end
end
