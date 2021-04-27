class CreateModelReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :model_reviews do |t|
      # Relations
      t.references :reviewable, polymorphic: true, index: false
      t.references :reviewer, polymorphic: true

      # Attirbutes
      t.string :title
      t.text :content
      t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index [:reviewable_type, :reviewable_id, :type, :status], name: "reviews_index"
    end

    # reversible do |dir|
    #   dir.up do
    #     Model.config.review.constant.create_translation_table!({
    #       title: :string, content: :text
    #     })
    #   end

    #   dir.down do
    #     Model.config.review.constant.drop_translation_table!
    #   end
    # end
  end
end
