class CreateModelStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :model_styles do |t|
      # Relations
      t.references :styleable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :name
      t.text :value

      t.timestamps

      # Indexes
      t.index [:styleable_id, :styleable_type, :type, :name], name: 'styles_index'
    end
  end
end
