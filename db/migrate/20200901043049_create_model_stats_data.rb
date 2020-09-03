class CreateModelStatsData < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stats_data do |t|
      # Relations
      t.references :statsable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :value

      t.timestamps

      # Indexes
      t.index [:statsable_id, :statsable_type, :type, :value], name: 'stats_data_index'
    end
  end
end
