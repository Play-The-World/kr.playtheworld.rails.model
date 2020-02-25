module Model::Seeder::V1
  class StageList < Base
    KEYS = {
      stage_list_number: "스테이지 리스트 번호",
      title: "스테이지 리스트 제목",
      component_type: "정답 양식",
      hint1_content: "힌트 1 내용",
      hint1_image_path: "힌트 1 이미지",
      hint2_content: "힌트 2 내용",
      hint2_image_path: "힌트 2 이미지",
      hint3_content: "힌트 3 내용",
      hint3_image_path: "힌트 3 이미지",
      coordinates: "문제 위치 좌표"
    }

    def initialize(values)
      super(values)
      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
    end

    def seed
      if @theme.nil?
        puts "[FATAL] Set Theme first!"
        return
      end

      stage_list_number = 0
      puts "Create StageLists"
      @values.each_with_index do |v, i|
        next if i == 0

        # StageListNumber
        stage_list_number = v[@keys[:stage_list_number]] ? 
          v[@keys[:stage_list_number]].to_i : 
          stage_list_number + 1

        # StageList
        stage_list = @theme.stage_lists.find_or_create_by!(
          title: v[@keys[:title]],
          stage_list_number: stage_list_number,
        )

        # StageListType
        component_type = Model::StageListType.component_type(of: v[@keys[:component_type]])
        if component_type.nil?
          puts "[FATAL] unknown ComponentType #{v[@keys[:component_type]]}."
          return
        end
        stage_list_type = stage_list.stage_list_type.create!(
          component_type: component_type.new
        )

        # Coordinates
        x = (v[@keys[:coordinates]]).split(",")[0].delete(' ').to_f rescue 0
        y = (v[@keys[:coordinates]]).split(",")[1].delete(' ').to_f rescue 0
        stage_list_type.create_coordinate!(x: x, y: y) if x > 0 and y > 0

        # Hints
        hints = []
        make_hint = ->(content, image_url, answer) {
          return nil if (content.nil? or content.empty?) and (image_url.nil? or image_url.empty?)
          hint = Hash.new
          hint[:content] = content if content
          hint[:type] = answer ? :answer : :default
          if image_url and !image_url.empty?
            hint[:images] = [
              {
                store_type: "external",
                url: "#{@base_url}#{image_url}"
              }
            ]
          end
          return hint
        }
        hints << make_hint[v[@keys[:hint1_content]], v[@keys[:hint1_image_path]], false]
        hints << make_hint[v[@keys[:hint2_content]], v[@keys[:hint2_image_path]], false]
        hints << make_hint[v[@keys[:hint3_content]], v[@keys[:hint3_image_path]], true]
        hints.compact!
        hints.each_with_index do |h, index|
          hint = quiz_type.hints
            .create!(
              contents: h[:content] ? h[:content] : "", 
              hint_number: (h[:hint_number].nil? or h[:hint_number].empty?) ? (index + 1) : h[:hint_number].to_i, 
              type: h[:hint_type]
            )
          h[:images].each do |image|
            hint.images
              .create!(
                store_type: image[:store_type], 
                url: image[:url]
              ) if image[:url] and !image[:url].empty?
          end if h[:images]
        end
      end

      self
    end
  end
end