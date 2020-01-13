module Model
  module Translatable
    extend ActiveSupport::Concern

    included do
      def cache_key
        super + '-' + Globalize.locale.to_s
      end

      # Interpolation reference
      # https://stackoverflow.com/a/23360608
    end
  end
end