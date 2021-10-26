module Model
  class Provider < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :user, class_name: Model.config.user.class_name

    # Enums
    extend Enumerize
    enumerize :type, in: %i(oauth oauth2), default: :oauth2
    enumerize :name, in: %i(unknown naver kakao google apple facebook), default: :unknown
  end
end
