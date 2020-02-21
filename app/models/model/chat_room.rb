module Model
  class ChatRoom < ApplicationRecord
    # Relations
    belongs_to :chattable, polymorphic: true
  end
end
