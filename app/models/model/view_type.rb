module Model
  class ViewType < ApplicationRecord
    # Relations
    belongs_to :viewable, polymorphic: true
    has_many :views

    # Enums
    extend Enumerize
    # 모든 조회, 유저만 조회, 중복 불가능, 중복 불가능한 유저
    # 모든 => 로그인을 하지 않아도 조회수가 올라감
    # 유저만 => 로그인을 한 유저의 조회만 올라감
    enumerize :type, in: %i(all all_user once once_user), default: :once
  end
end
