module Model::Serializer
  class User < Base
    # Attributes
    attributes :name, :nickname, :phonenumber
    
    # Relations
    # has_many :teams
    # has_many :achievements
    # has_one :maker
  end
end