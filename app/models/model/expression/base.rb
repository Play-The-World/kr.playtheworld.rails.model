module Model
  module Expression
    class Base < ApplicationRecord
      # Relations
      belongs_to :expression_type, counter_cache: true
      belongs_to :expresser, polymorphic: true
    end
  end
end
