class CreateModelModals < ActiveRecord::Migration[6.0]
  def change
    create_table :model_modals do |t|
      # Relations
      t.references :modalable, polymorphic: true

      # Attributes
      t.string :status
      t.string :type
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Model::Modal.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model::Modal.drop_translation_table!
      end
    end
  end
end
