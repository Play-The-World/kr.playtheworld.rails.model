module Model::Seeder::V1
  class Image < Base
    KEYS = {
      stage_number: "스테이지 번호",
      image_type: "이미지 유형",
      image_number: "이미지 번호",
      image_url: "이미지 경로"
    }
    attr_reader :images

    def initialize(values)
      super(values)

      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
      @images = []
    end

    def seed
      if @theme.nil?
        puts "Set Theme first !"
        return
      end
      puts "Create Images"
      @values.each_with_index do |v, i|
        next if i == 0

        case v[@keys[:image_type]]
        # when "answer"
        #   # Image
        #   stage = @theme.stages.find_by(stage_number: v[@keys[:stage_number]])

        #   if stage.nil?
        #     puts "[WARN] Stage(stage_number: #{v[@keys[:stage_number]]}) not found."
        #     next
        #   end

        #   image = stage.quiz_images
        #     .create!(
        #       image_number: v[@keys[:image_number]].to_i, 
        #       value: "#{@base_url}#{v[@keys[:image_url]]}"
        #     )
        #   @images << image
        when "answer"
          nil
        else
          puts "[WARN] Unknown ImageType #{v[@keys[:image_type]]}."
          next
        end
      end

      self
    end
  end
end