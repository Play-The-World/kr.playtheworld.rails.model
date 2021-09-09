module Model
  module HasOneAttached
    extend ActiveSupport::Concern

    included do
      include Rails.application.routes.url_helpers
      # TODO: Multi 저장소 설정 가능하도록 변경하기
      # has_one_attached :file, service: :admin_s3
      has_one_attached :file, service: :test

      # Enums
      extend Enumerize
      enumerize :store_type, in: %i(external s3), default: :external

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
        case store_type.to_sym
        when :external
          value
        when :s3
          file.url # || polymorphic_url(file)
        end
      end
    end
  end
end