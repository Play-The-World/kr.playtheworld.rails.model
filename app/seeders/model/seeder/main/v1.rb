module Model::Seeder::Main
  class V1 < Base
    # Amazon S3 Base URL
    AMAZON_S3_BASE_URL = "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/"
    attr_accessor :base_url
  
    KEYS = {
      theme: "테마",
      makers: "제작자",
      stages: "스테이지",
      images: "이미지",
      items: "아이템",
      events: "이벤트",
      conditions: "조건",
      achievements: "업적",
      sounds: "사운드"
    }
  
    def initialize(id)
      @service = Model::Api::Google::Spreadsheet.new(id)
      @values = Hash.new
      KEYS.each do |k, v|
        @values[k] = @service.values(v)
      end
      @base_url = AMAZON_S3_BASE_URL
    end
  
    def test
      puts "Testing..."
      errors = []
  
      # TestCode
      
  
      puts "Done."
      return errors
    end
  
    def seed
      # Seed into DB
      puts "Seeding..."
  
      # Achivement
      Model::Seeder::V1::Achievement.new(@values[:achievements])
        .set_base_url(@base_url)
        .seed
  
      # Theme
      theme_seeder = Model::Seeder::V1::Theme.new(@values[:theme])
        .set_base_url(@base_url)
        .seed
      @base_url = theme_seeder.base_url
      theme = theme_seeder.theme
  
      # Stage
      # Model::Seeder::V1::Stage.new(@values[:stages])
      #   .set_theme(theme)
      #   .set_base_url(@base_url)
      #   .seed
  
      # Maker
      Model::Seeder::V1::Maker.new(@values[:makers])
        .set_theme(theme)
        .seed
  
      # Image
      Model::Seeder::V1::Image.new(@values[:images])
        .set_theme(theme)
        .set_base_url(@base_url)
        .seed
      
      # Item
      Model::Seeder::V1::Item.new(@values[:items])
        .set_theme(theme)
        .set_base_url(@base_url)
        .seed
  
      # Event
      events = Model::Seeder::V1::Event.new(@values[:events])
        .set_theme(theme)
        .seed
        .events
      
      # Condition
      Model::Seeder::V1::Condition.new(@values[:conditions])
        .set_theme(theme)
        .set_events(events)
        .seed
  
      # Sound
      Model::Seeder::V1::Sound.new(@values[:sounds])
        .set_theme(theme)
        .set_base_url(@base_url)
        .seed
  
      puts "Done."
    end
  end    
end