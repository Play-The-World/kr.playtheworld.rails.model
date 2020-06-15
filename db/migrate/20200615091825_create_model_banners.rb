class CreateModelBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :model_banners do |t|
      # TODO: 배너모델이 정말 필요한가?

      t.timestamps
    end
  end
end
