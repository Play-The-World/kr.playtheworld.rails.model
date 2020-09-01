module Model
  module Statsable
    extend ActiveSupport::Concern

    included do
      has_many :stats_data, as: :statsable, dependent: :destroy, class_name: Model.config.stats_data.class_name

      def played_time
        data(:played_time).value.to_i
      end
      def played_time=(new_value)
        data(:played_time).update(value: new_value)
      end
      
      private
        def data(data_type)
          data_type = data_type.to_s.camelize
          raise "DataType #{data_type} is not defined." unless Model::UserData.types.map(&:to_s).include?(data_type)

          user_data.first_or_create_by(type: "Model::UserData::#{data_type}")
        end
    end
  end
end