module Model
  module Expression
    class Base < ApplicationRecord
      # Relations
      belongs_to :expression_type, counter_cache: true
      belongs_to :expresser, polymorphic: true

      def self.serializer
        Model::Serializer::Expression
      end
    end
  end
end
