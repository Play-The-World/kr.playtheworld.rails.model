module Model::Seeder::V1
  class Sound < Base
    KEYS = {
      type: "사운드 유형",
      stage_number: "대상 스테이지 번호",
      url: "사운드 파일 주소"
    }
    attr_reader :sounds

    def initialize(values)
      super(values)

      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
      @sounds = []
    end

    def seed    
      if @theme.nil?
        puts "Set Theme first !"
        return
      end
      puts "Create Sounds"
      @values.each_with_index do |v, i|
        next if i == 0

        # next if v[@keys[:stage_number]].nil? or v[@keys[:stage_number]].empty?

        # stage = @theme.stages.find_by(stage_number: v[@keys[:stage_number]].to_i) rescue nil
        # if stage.nil?
        #   puts "[WARN] Stage(stage_number: #{v[@keys[:stage_number]]}) not found. (row: #{i + 1})"
        #   next
        # end
        
        # next if v[@keys[:type]].nil? or v[@keys[:type]].empty?

        # case v[@keys[:type]]
        # when "효과음"
        #   music_type = "effect"
        # when "배경음악"
        #   music_type = "background"
        # else
        #   puts "[WARN] Unknown SoundType #{v[@keys[:type]]}."
        #   next
        # end

        # next if v[@keys[:url]].nil? or v[@keys[:url]].nil?

        # sound = stage.musics.create(
        #   music_type: music_type,
        #   url: "#{@base_url}#{v[@keys[:url]]}"
        # ) 
        # @sounds << sound
      end

      self
    end
  end
end