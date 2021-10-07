module Model::Serializer
  class Character < Base
    view :base do
      fields :title, :content, :statement, :first_name, :last_name, :gender, :type, :age, :alibi, :super_theme_id
      
      # Relations
      # association :images, blueprint: Image, view: :base
    end

    view :play do
      include_view :base

      # field :user_id do |a|
      #   if Model.current.game_room
      #     # pick
      #   end
      # end
      association :images, blueprint: Image, view: :base
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end