module Model::Serializer
  class User < Base
    view :base do
      fields  :status,
              :email,
              :nickname,
              :sign_up_step
              # :password,
              # :password_confirmation,
              # :phonenumber,
              # :email_confirmation
      
      # Relations
      # association :images, blueprint: Image
    end

    view :with_last_play do
      include_view :base

      field :last_play do |a|
        a.plays.where(finished_at: nil).last&.as_json(:simple)
      end
    end

    view :play do
      include_view :base
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end