class CreateModelGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :model_guests do |t|
      # TODO: 추가 정보 기입
      # Attributes
      t.string :ip
      t.string :os
      t.string :device

      t.timestamps
    end
  end
end
