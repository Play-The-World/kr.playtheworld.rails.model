module Model
  module HasVariables
    extend ActiveSupport::Concern

    included do
      has_many :variables, as: :object, dependent: :destroy
      alias_attribute :vars, :variables
    end
  end
end