module Model
  class InfoFile < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :infoable, polymorphic: true
    belongs_to :character, class_name: Model.config.character.class_name, optional: true

    # Serializer
    serialize :value, Model::ArrayHashSerializer

    # Enums
    extend Enumerize
    enumerize :type, in: %i(introduction private), default: :introduction

    def content
      value.map do |v|
        # case v["type"]
        # when ""
        # end
        unless v["value"].nil?
          v["value"] = convert(v["value"])
        end
        v
      end
    end

    def convert(v)
      return nil unless v.is_a?(String)
      str = v

      st = infoable if infoable.is_a?(Model::SuperTheme::Base)
      st ||= character&.super_theme
      st ||= infoable&.super_theme rescue nil
      td = infoable if infoable.is_a?(Model::ThemeData)
      td ||= Model.current.game_room&.theme_data
      t = infoable if infoable.is_a?(Model::Theme::Base)
      t ||= td&.theme

      if str.include?('%{posterImage}')
         url = st.images.find { |i| i.type == 'poster' }&.url rescue nil
         str.gsub!('%{posterImage}', url) if url
      end

      if str.include?('%{relationImage}')
        url = t.images.find { |i| i.type == 'relation' }&.url rescue nil
        str.gsub!('%{relationImage}', url) if url
      end

      if str.include?('%{gameMapImage}')
        url = st.images.find { |i| i.type == 'game_map' }&.url rescue nil
        str.gsub!('%{gameMapImage}', url) if url
      end

      return str
    end
  end
end
