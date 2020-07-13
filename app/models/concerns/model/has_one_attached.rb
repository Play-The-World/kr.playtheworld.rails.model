module Model
  module HasOneAttached
    extend ActiveSupport::Concern

    included do
      include Rails.application.routes.url_helpers
      has_one_attached :file

      def filename
        file.filename.to_s
      end
      def attach(params)
        file.attach(params)
      end
      def attached?
        file.attached?
      end
      def url
        polymorphic_url(file)
      end
    end
  end
end