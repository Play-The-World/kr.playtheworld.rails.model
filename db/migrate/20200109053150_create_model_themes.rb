class CreateModelThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_themes do |t|
      # Relations
      t.references :super_theme, index: false

      # Attributes
      t.string :fake_id
      t.string :status
      t.string :type
      t.string :play_type
      t.string :theme_type
      t.integer :difficulty, default: 1
      t.text :render_type
      t.integer :price, null: false, default: 0
      t.integer :play_time
      t.integer :data_size
      t.integer :super_plays_count, null: false, default: 0
      t.integer :current_version, null: false, default: 1
      t.integer :play_user_count, null: false, default: 1
      t.integer :order, default: 1

      t.boolean :use_memo, default: true
      t.boolean :is_reviewable, default: true
      t.boolean :is_rankable, default: true

      # Making때문?
      t.boolean :has_deadline, default: false
      t.datetime :deadline
      t.boolean :has_caution, default: false
      t.boolean :need_agreement, default: false
      t.boolean :has_additional_text, default: false

      t.string :publish_type
      t.boolean :publish_alert, default: false

      t.boolean :has_teaser_stage, default: false
      t.string :price_type
      
      t.timestamps

      # Indexes
      t.index :type
      # t.index :status
      # t.index [:super_theme_id, :status]
      t.index [:super_theme_id, :order]
      t.index [:super_theme_id, :theme_type]#, unique: true
    end

    reversible do |dir|
      dir.up do
        Model.config.theme.constant.create_translation_table!({
          content: :text, caution: :string, caution_bold: :string, start_address: :string, start_position: :string, additional_text: :string
        })
      end

      dir.down do
        Model.config.theme.constant.drop_translation_table!
      end
    end
  end
end
