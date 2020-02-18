module Model::Seeder::V1
  class Base
    AMAZON_S3_BASE_URL = "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/"

    attr_accessor :values
    attr_accessor :base_url
    
    def initialize(values)
      @base_url = AMAZON_S3_BASE_URL
    end
    def set_theme(theme)
      @theme = theme
      self
    end
    def set_base_url(url)
      @base_url = url
      self
    end

    def test; end
    def seed; end
  end
end