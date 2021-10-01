module Model::Team
  class Default < Base
    # Relations
    # has_many :game_rooms, dependent: :destroy

    # Validates
    # validates ${:attribute}

    def start_play(options = {})
      if options[:theme_data]
        # return if Model.current.game_room&.status == :started

        sp = super_plays.create(super_theme: options[:theme_data].super_theme)
        if Model.current.game_room
          Model.current.game_room.update!(super_play: sp, status: :started)
        end
        users.map do |u|
          play = Model::Play::Playing.create!({
            super_play: sp,
            user: u,
            theme_data: options[:theme_data],
            # character: Model.current.game_room&.character_in_game_rooms&.find { |cig| cig.user == u }&.character,
          })
          Model.current.game_room&.character_in_game_rooms&.find { |cig| cig.user == u }&.update(play: play)
          play
        end
      # elsif options[:theme]
      #   sp = super_plays.create(super_theme: options[:theme].super_theme)
      #   Model::Play::Playing.create(super_play: sp, user: user, theme_data: options[:theme].current_theme_data)
      # elsif options[:super_theme]
      #   theme = options[:super_theme].themes.find_by(theme_type: options[:theme_type])
      #   raise "Invalid theme_type: #{options[:theme_type]}" if theme.nil?

      #   sp = super_plays.create(super_theme: options[:super_theme])
      #   Model::Play::Playing.create(super_play: sp, user: user, theme_data: theme.current_theme_data)
      else
        raise "theme_data or theme or super_theme must not be nil"
      end
    end

    # private
    #   def user
    #     users.take
    #   end
  end
end