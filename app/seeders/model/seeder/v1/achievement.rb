module Model::Seeder::V1
  class Achievement < Base
    KEYS = {
      level: "등급",
      title: "업적 이름",
      contents: "업적 설명",
      condition_contents: "업적 조건",
      image_url: "이미지 파일명"
    }
    attr_reader :achievements
  
    def initialize(values)
      super(values)
  
      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
      @achievements = []
    end
  
    def seed
      base_url = "#{@base_url}badges/"
      puts "Create Achievements"
      @values.each_with_index do |v, i|
        next if i == 0
        case v[@keys[:level]]
        when "일반"
          level = 1
        when "희귀"
          level = 2
        when "전설"
          level = 3
        else
          puts "[WARN] Unknown Level #{v[@keys[:level]]}"
          next
        end
  
        a = Model::Achievement.find_or_create_by!(
          level: level,
          title: v[@keys[:title]],
          content: v[@keys[:contents]],
          condition_content: v[@keys[:condition_contents]]
        )
        
        if v[@keys[:image_url]] and !v[@keys[:image_url]].empty?
          image_url = "#{base_url}#{v[@keys[:image_url]]}"
        else
          image_url = "#{base_url}0#{level}_badge_#{v[@keys[:title]].delete(' ')}.svg" rescue nil
        end
        
        a.images.find_or_create_by!(
          store_type: :external,
          value: image_url
        )
  
        @achievements << a
      end
  
      self
    end
  end
end