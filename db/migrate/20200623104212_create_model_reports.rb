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
      t.index [:reporter_type, :reporter_id, :type], name: "reports_index"
      t.index [:reportable_type, :reportable_id, :type], name: "reports_index2"
    end
  end
end
