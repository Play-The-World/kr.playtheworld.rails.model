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
    self.inheritance_column = "not_sti"

    # 필요 없을 것 같아 국제화 기능 제거
    # Translations
    # include Model::Translatable
    # translates :name, :content

    # Relations
    has_many :entries, dependent: :destroy
    has_many :users, through: :entries, class_name: Model.config.user.class_name
    has_many :super_plays, class_name: Model.config.super_play.class_name
    include Model::Clearer

    # Status
    include Model::HasStatus
    set_status %i(removed blocked)

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default solo), default: :default
    
    def self.serializer
      Model::Serializer::Team
    end
  end
end
