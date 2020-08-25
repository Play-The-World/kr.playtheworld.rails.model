module Model::Serializer
  class User < Base
    view :base do
      fields  :status,
              :email,
              :nickname
              # :password,
              # :password_confirmation,
              # :phonenumber,
              # :email_confirmation
      
      # Relations
      # association :images, blueprint: Image
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