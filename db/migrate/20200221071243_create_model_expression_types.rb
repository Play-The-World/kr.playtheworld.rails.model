class CreateModelExpressionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_expression_types do |t|
      # Relations
      t.references :expressable, polymorphic: true
      
      # Attributes
      t.integer :basis_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :dislikes_count, default: 0
      t.integer :funnies_count, default: 0

      t.timestamps
    end
  end
end
