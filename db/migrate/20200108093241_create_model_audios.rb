class CreateModelAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :model_audios do |t|
      t.references :audioable, polymorphic: true

      t.timestamps
    end
  end
end
