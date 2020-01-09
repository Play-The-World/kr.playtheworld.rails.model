module Model
  module HasStatus
    extend ActiveSupport::Concern

    included do
      extend Enumerize
    end

    module ClassMethods
      # https://stackoverflow.com/questions/26960964/ruby-on-rails-including-a-module-with-arguments
      def set_status(status)
        return unless status.to_a?(Array)
        status << :default unless status.include?(:default)
        enumerize :status, in: status.uniq, default: :default
      end
    end
  end
end