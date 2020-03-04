module Model
  # 팀 클래스
  # 
  # == Relations
  # 
  # ==== has_many
  # 
  # * Entry
  # * User
  # * ConditionClear
  # 
  # == Status
  # 
  # * +:removed+ - 삭제된 상태
  # * +:blocked+ - 차단된 상태
  # 
  # == Translations
  # 
  # * +:name+
  # * +:content+
  class Team < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :name, :content

    # Relations
    has_many :entries, dependent: :destroy
    has_many :users, through: :entries
    include Model::Clearer

    # Status
    include Model::HasStatus
    set_status %i(removed blocked)
    
    def self.serializer
      Model::Serializer::Team
    end
  end
end
