module Model
  module Interpolatable
    extend ActiveSupport::Concern

    included do
      has_many :interpolations, as: :interpolatable, class_name: Model.config.interpolation.class_name, dependent: :destroy

      def interpolate(string)
        str = string
        interpolations.each do |i|
          str.gsub!(i.marker, i.result)# if str.include?(i.marker)
        end
        str
      end
    end
  end
end