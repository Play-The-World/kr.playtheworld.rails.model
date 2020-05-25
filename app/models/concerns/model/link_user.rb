module Model
  module LinkUser
    extend ActiveSupport::Concern

    included do
      has_many :link_usages, as: :link_user, dependent: :nullify
    end
  end
end