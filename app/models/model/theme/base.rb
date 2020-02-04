module Model
  module Theme
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.theme.table_name

      # Translations
      include Model::Translatable
      translates :content, :caution

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked)

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      has_many :stage_lists, dependent: :destroy
      # TODO SQL query를 사용해서 stages 추가하기

      # Callbacks
      before_validation :set_theme_type

      # Validations
      validates :theme_type,
        uniqueness: { scope: :super_theme_id, message: "should be unique to super_theme" }

      # Repository
      def self.repo
        Model::Repository::Theme.new
      end

      protected
        def set_theme_type
          nil
        end
    end
  end
end
