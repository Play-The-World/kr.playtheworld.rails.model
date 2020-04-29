class CreateModelClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :model_classifications do |t|
      t.references :classifier, polymorphic: true, index: { name: "classifications_index1" }
      t.references :classifiable, polymorphic: { default: Model::SuperTheme::Base.to_s }, index: { name: "classifications_index2" }

      t.timestamps
    end
  end
end
