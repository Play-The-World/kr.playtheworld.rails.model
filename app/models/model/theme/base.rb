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
      include Model::Viewable
      has_many :super_plays, dependent: :destroy, counter_cache: true
      # TODO SQL query를 사용해서 stages 추가하기
      include Model::Interpolatable

      # Render Type
      RENDER_TYPE = Model::RenderType
      serialize :render_type, RENDER_TYPE::Base

      def render_types
        RENDER_TYPE.constants.select { |k| RENDER_TYPE.const_get(k).instance_of? Class } - [:Base]
      end

      # Callbacks
      before_validation :set_theme_type
      before_create :generate_fake_id

      # Validations
      validates :theme_type,
        uniqueness: { scope: :super_theme_id, message: "should be unique to super_theme" }

      # Repository
      def self.repo
        Model::Repository::Theme.new
      end

      private
        def generate_fake_id
          begin
            self.fake_id = SecureRandom.hex(8)
          end while self.class.exists?(fake_id: self.fake_id)
        end

      protected
        def set_theme_type
          nil
        end
    end
  end
end
