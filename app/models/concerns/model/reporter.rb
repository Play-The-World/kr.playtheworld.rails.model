module Model
  module Reporter
    extend ActiveSupport::Concern

    included do
      has_many :reports, as: :reporter, dependent: :destroy
    end
  end
end