module Model::Seeder::V1
  class Theme < Base
    KEYS = {
      title: "제목",
      title_en: "영문 제목",
      summary: "테마 요약",
      genre: "장르",
      coordinates: "시작 위치(GPS x,y)",
      start_address: "시작 위치 주소",
      start_position: "시작 위치 설명",
      location_name: "지역 이름",
      contents: "테마 설명",
      theme_type: "테마 표시 타입",
      theme_type_value: "테마 타입",
      play_time: "플레이 시간",
      data_size: "사용 데이터양",
      thumbnail_url: "테마 썸네일 주소",
      poster_url: "테마 포스터 주소",
      render_type: "테마 플레이 타입",
      start_stage_list_number: "시작 스테이지 리스트 번호",
      s3_dirname: "Amazon S3 폴더 이름"
    }
    attr_reader :theme

    def initialize(values)
      super(values)
      @values = Hash.new
      values.each_with_index do |v, i|
        next if i == 0
        unless key = KEYS.key(v[0])
          puts "[WARN] Key #{v[0]} not found."
          next
        end
        @values[key] = v[1]
      end
    end

    def seed
      # Base_URL
      @base_url = "#{@base_url}#{@values[:s3_dirname]}/"
      
      # Location
      location = (@values[:location_name].nil? or @values[:location_name].empty?) ? 
        Model::Location.find_or_create_by!(title: "온라인") : 
        Model::Location.find_or_create_by!(title: @values[:location_name])
      
      # RenderType
      render_type = Model::RenderType::Swiper.new
      case @values[:render_type]&.downcase
      when "scroll"
        render_type = Model::RenderType::Scroll.new
      when "text"
        render_type = Model::RenderType::Text.new
      end

      puts "Create SuperTheme and Theme."
      # SuperTheme and Theme
      play_time = @values[:play_time].to_i * 60 rescue 0
      
      case @values[:theme_type]
      when "시리즈"
        super_theme_class = Model::SuperTheme::Series
      when "난이도"
        super_theme_class = Model::SuperTheme::Difficulty
      when "RPG"
        super_theme_class = Model::SuperTheme::RolePlay
      when "연재"
        super_theme_class = Model::SuperTheme::Numbered
      else
        puts "[FATAL] Wrong theme type #{@values[:theme_type]}." and return
      end
      theme_class = super_theme_class.theme_class

      @theme = theme_class.new(
        render_type: render_type,
        play_time: play_time,
        data_size: @values[:data_size],
        start_address: @values[:start_address],
        start_position: @values[:start_position],
        content: @values[:contents],
        start_stage_list_number: @values[:start_stage_list_number],
        theme_type: @values[:theme_type_value].downcase
      )
      super_theme_class.find_or_create_by!(
        title: @values[:title],
        summary: @values[:summary],
        genre: Model::Genre.find_or_create_by!(title: @values[:genre]),
        location: location,
        play_time: play_time,
        data_size: @values[:data_size],
        content: @values[:contents]
      ).themes << @theme

      # Images
      @theme.super_theme.images.create!([
        {
          store_type: :external,
          image_type: :poster,
          value: "#{@base_url}#{@values[:poster_url]}"
        },
        {
          store_type: :external,
          image_type: :thumbnail,
          value: "#{@base_url}#{@values[:thumbnail_url]}"
        }
      ])
      
      # Coordinates
      x = @values[:coordinates].split(",")[0].delete(' ').to_f rescue 0
      y = @values[:coordinates].split(",")[1].delete(' ').to_f rescue 0
      @theme.coordinates << Model::Coordinate::Map.new(x: x, y: y) if x > 0 and y > 0

      self
    end
  end
end