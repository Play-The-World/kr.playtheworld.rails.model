module Model
  class LinkUsage < ApplicationRecord
    # Relations
    belongs_to :link, counter_cache: :link_usage
    belongs_to :link_user, polymorphic: true, optional: true
  end
end
