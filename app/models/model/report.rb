module Model
  class Report < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :reporter, polymorphic: true
    belongs_to :reportable, polymorphic: true

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default defamation abuse pornography spam domination), default: :default
  end
end
