module Model::Serializer
  class Topic < Base
    # ID
    # set_id :nothing

    # Attributes
    attributes :title
    
    # Relations
    has_many :super_themes
  end
end