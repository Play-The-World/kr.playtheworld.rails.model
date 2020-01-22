module Model
  module Config
    include ActiveSupport::Configurable

    class ModelConfiguration
      attr_accessor :class_name
      attr_accessor :table_name

      def initialize(class_name = nil, table_name = nil)
        @class_name = class_name
        @table_name = table_name
      end

      def constant
        # [TODO] 예외처리
        @class_name ? @class_name.constantize : nil
      end
    end

    # Key: Default Value
    CONFIGS = {
      condition: ModelConfiguration.new("Model::Condition::Base", "model_conditions"),
      coordinate: ModelConfiguration.new("Model::Coordinate::Base", "model_coordinates"),
      event: ModelConfiguration.new("Model::Event::Base", "model_events"),
      interpolation: ModelConfiguration.new("Model::Interpolation::Base", "model_interpolations"),
      stage: ModelConfiguration.new("Model::Stage::Base", "model_stages"),
      super_theme: ModelConfiguration.new("Model::SuperTheme::Base", "model_super_themes"),
      theme: ModelConfiguration.new("Model::Theme::Base", "model_themes"),
      token: ModelConfiguration.new("Model::Token::Base", "model_tokens"),
      board: ModelConfiguration.new("Model::Board::Base", "model_boards"),
      post: ModelConfiguration.new("Model::Post::Base", "model_posts"),
      comment: ModelConfiguration.new("Model::Comment::Base", "model_comments"),
      review: ModelConfiguration.new("Model::Review::Base", "model_reviews"),
      otp_digits: 6,
      otp_expiry_time: 3.minutes
    }
    CONFIGS.each do |k, v|
      config_accessor(k) { v }
    end
  end
end