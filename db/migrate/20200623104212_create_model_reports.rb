class CreateModelReports < ActiveRecord::Migration[6.0]
  def change
    create_table :model_reports do |t|
      # Relations
      t.references :reporter, polymorphic: true, index: false
      t.references :reportable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.text :content

      t.timestamps

      # Indexes
      t.index [:reporter_id, :reporter_type, :type]
      t.index [:reportable_id, :reportable_type, :type]
    end
  end
end
