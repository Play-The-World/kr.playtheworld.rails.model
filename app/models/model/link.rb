module Model
  class Link < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Constants
    FAKE_ID_LENGTH = 10

    # Relations
    belongs_to :linkable, polymorphic: true
    has_many :link_usages, dependent: :destroy

    # Status
    include Model::HasStatus
    set_status %i(disabled)

    # Enums
    enumerize :type, in: %i(default answer), default: :default

    # Callbacks
    before_create :set_fake_id

    private
      def set_fake_id
        return unless fake_id.nil? or fake_id.empty?

        begin
          self.fake_id = SecureRandom.hex(FAKE_ID_LENGTH)
        end while self.class.exists?(fake_id: self.fake_id)
      end
  end
end
