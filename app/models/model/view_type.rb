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

    def viewed_by(viewer)
      case type.to_sym
      when :all_user
        return false unless viewer.is_a?(Model::User)
      when :once
        return false if views.exists?(viewer: viewer)
      when :once_user
        return false unless viewer.is_a?(Model::User)
        return false if views.exists?(viewer: viewer)
      end
      views.create(viewer: viewer) and return true
    end
  end
end
