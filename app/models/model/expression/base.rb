module Model
  module Expression
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.expression.table_name

      # Relations
      belongs_to :expression_type, counter_cache: true
      belongs_to :expresser, polymorphic: true

      def self.serializer
        Model::Serializer::Expression
      end
    end
  end
end
