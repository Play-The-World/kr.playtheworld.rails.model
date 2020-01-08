module Model
  module Translatable
    extend ActiveSupport::Concern

    included do
      def cache_key
        super + '-' + Globalize.locale.to_s
      end
    end
  end
end