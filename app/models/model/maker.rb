module Model
  class Maker < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Translations
    # include Model::Translatable
    # translates :name, :content
    
    # Relations
    belongs_to :user, optional: true, class_name: Model.config.user.class_name
    has_many :maker_entries, dependent: :destroy
    has_many :maker_teams, through: :maker_entries
    include Model::Creator

    # Status
    include Model::HasStatus
    set_status %i(blocked)
    # enumerize :type, in: %i(default temp), default: :default

    before_create :set_default_name

    def self.serializer
      Model::Serializer::Maker
    end

    private
      def set_default_name
        name = user&.nickname if name.nil?
      end
  end
end
