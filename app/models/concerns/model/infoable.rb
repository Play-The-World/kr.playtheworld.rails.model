module Model
  module Infoable
    extend ActiveSupport::Concern

    included do
      has_many :info_files, as: :infoable, dependent: :destroy
    end
  end
end