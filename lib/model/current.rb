require 'active_support/core_ext/module'

module Model
  module Current
    MODELS = %i(
      user
      team
      super_play
      play
      theme
      super_theme
      game_room
    )

    MODELS.each do |accessor|
      thread_mattr_accessor(accessor)
    end
  end 
end