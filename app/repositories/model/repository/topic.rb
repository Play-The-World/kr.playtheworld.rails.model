module Model::Repository
  class Topic < Base
    def current_topics_with_super_themes
      current_setting.topics.with_translations.includes(super_themes: [:genres, :images])
      # TODO: 쿼리지옥 어떡함?
      # entity.joins(:setting)
      #   .where("#{Model::Setting.table_name}": { id: current_setting.id })
      #   .includes(super_themes: [:genres, :images])
      #   .with_translations
    # rescue
    #   []
    end

    private
      def entity
        Model::Topic::Base
      end

      def current_setting
        Model::Application.current.setting
      end
  end
end