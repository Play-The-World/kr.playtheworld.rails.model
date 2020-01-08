module Model
  module HasManyAttached
    extend ActiveSupport::Concern

    included do
      has_many_attached :files

      def attach(*params)
        files.attach(params)
      end
      def attached?
        files.attached?
      end
    end
  end
end