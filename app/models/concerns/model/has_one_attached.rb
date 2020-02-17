module Model
  module HasOneAttached
    extend ActiveSupport::Concern

    included do
      has_one_attached :file

      def attach(params)
        file.attach(params)
      end
      def attached?
        file.attached?
      end
    end
  end
end