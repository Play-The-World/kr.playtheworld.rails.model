module Model
  class Entry < ApplicationRecord
    # Relations
    # belongs_to :team, class_name: Model.config.team.class_name
    belongs_to :entryable, polymorphic: true
    belongs_to :user, class_name: Model.config.user.class_name    

    # Status
    include Model::HasStatus
    set_status %i(invited kicked)
    enumerize :current, in: %i(
      default
      pick
      introduction
      private_info
      custom
      ready
    ), default: :default
  end
end
