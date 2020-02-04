module Model::Serializer
  class User < Base
    attributes :name, :nickname, :phonenumber
    
    has_many :teams
    has_many :achievements
    has_one :maker
  end
end