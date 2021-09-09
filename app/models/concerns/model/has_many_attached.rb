module Model
  module HasManyAttached
    extend ActiveSupport::Concern

    included do
      # has_many_attached :files, service: :admin_s3
      has_many_attached :files, service: :test

      def filenames
        files.map { |f| f.filename.to_s }
      end
      def attach(params)
        files.attach(params)
      end
      def attached?
        files.attached?
      end
    end
  end
end