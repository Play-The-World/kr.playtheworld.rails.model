module Model
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    # :rememberable
    devise :database_authenticatable, :registerable,
           :recoverable, :validatable, :trackable

    #  Relations
    has_many :entries, dependent: :destroy
    has_many :teams, through: :entries
    has_one :maker, dependent: :destroy
    has_many :achievements, foreign_key: "user_id", class_name: "Model::UsersAchievement"
    include Model::Reviewer
    include Model::Commenter

    # Status
    include Model::HasStatus
    set_status %i(removed blocked)

    # Tokenable
    include Model::Tokenable

    # Set Serializer
    def self.serializer
      Model::Serializer::User
    end
  end
end
