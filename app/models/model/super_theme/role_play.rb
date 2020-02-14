module Model::SuperTheme
  class RolePlay < Base
    def create_theme(params)
      Model::Theme::RolePlay.create(params)
    end
  end
end