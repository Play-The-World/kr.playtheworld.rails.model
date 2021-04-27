class CreateModelSuperPlays < ActiveRecord::Migration[6.0]
  def change
    create_table :model_super_plays do |t|
      # Relations
      t.references :team, index: false
      t.references :super_theme, index: false

      # Attirbutes
      t.string :status
      t.string :type
      t.integer :plays_count, default: 0

      t.timestamps

      # Indexes
      # 이거 잘 될지 모르겠다.
      t.index [:team_id, :type, :status]
      t.index [:super_theme_id, :type, :status]
    end
  end
end
