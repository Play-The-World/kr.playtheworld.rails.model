module Model
  module HasSetting
    extend ActiveSupport::Concern

    included do
      has_one :setting, as: :settingable, dependent: :destroy
    end
  end
end