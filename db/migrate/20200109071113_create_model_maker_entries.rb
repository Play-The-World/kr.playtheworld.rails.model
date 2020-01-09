class CreateModelMakerEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_maker_entries do |t|
      # Relations
      t.references :model_maker
      t.references :model_maker_team

      t.timestamps
    end
  end
end
