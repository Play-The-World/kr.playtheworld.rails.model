module Model
  module SuperPlay
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.super_play.table_name

      # Relations
      belongs_to :team
      has_many :plays, class_name: Model.config.play.class_name, dependent: :destroy, foreign_key: "super_play_id"
    end
  end
end
