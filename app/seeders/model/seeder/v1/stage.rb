module Model::Seeder::V1
  class Stage < Base
    KEYS = {
      stage_list_number: "스테이지 리스트 번호",
      order: "순서",
      stage_number: "스테이지 번호",
      file_path: "파일 이름",
      stage_type: "타입",
      title: "스테이지 이름",
      contents: "페이지 내용",
      has_video: "비디오여부",
      component_type: "정답 양식",
      answers: "정답",
      target_stage_numbers: "다음 스테이지 번호",
      hint1_contents: "힌트 1 내용",
      hint1_image_path: "힌트 1 이미지",
      hint2_contents: "힌트 2 내용",
      hint2_image_path: "힌트 2 이미지",
      hint3_contents: "힌트 3 내용",
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

      stage_number = -1
      puts "Create Stages"
      @values.each_with_index do |v, i|
        next if i == 0

        # Stage Number
        stage_number = v[@keys[:stage_number]] ? 
          v[@keys[:stage_number]].to_i : 
          stage_number + 1
        # Stage Type
        stage_type = v[@keys[:stage_type]].downcase.to_sym rescue "script".to_sym

        # Stage
        stage = @theme.stages.find_or_create_by!(
          stage_type: stage_type,
          title: v[@keys[:title]],
          contents: v[@keys[:contents]],
          stage_number: stage_number,
          has_video: v[@keys[:has_video]]
        )

        # Background Image
        stage.images.create!(
          store_type: :external,
          image_type: :background,
          url: "#{@base_url}#{v[@keys[:file_path]]}"
        ) if v[@keys[:file_path]] and !v[@keys[:file_path]].empty? rescue false
        
        # Map Image
        stage.images.create!(
          store_type: :external,
          image_type: :map_image,
          url: "#{@base_url}#{v[@keys[:file_path]]}"
        ) if v[@keys[:map_image_url]] and !v[@keys[:map_image_url]].empty? rescue false

        # Coordinates
        x = (v[@keys[:coordinates]]).split(",")[0].delete(' ').to_f rescue 0
        y = (v[@keys[:coordinates]]).split(",")[1].delete(' ').to_f rescue 0
        stage.create_coordinate!(x: x, y: y) if x > 0 and y > 0
        
        # QuizType
        quiz_type = stage.create_quiz_type!(
          component_type: v[@keys[:component_type]].downcase
        ) rescue stage.create_quiz_type!

        # Answers
        answer_values = v[@keys[:answers]].split("|") rescue [ nil ]
        target_stage_numbers = v[@keys[:target_stage_numbers]].split("|") rescue [ stage_number + 1 ]
        answer_values = [" "] if target_stage_numbers.size == 1 and answer_values.size == 0
        answers = answer_values.zip(target_stage_numbers)
          .map { |v, n|
            {
              answer: v,
              answer_content: v,
              target_stage_number: n.nil? ? stage_number + 1 : n.to_i
            }
          }
        answers << { target_stage_number: stage_number + 1 } if answers.empty?
        answers.each do |a|
          answer = quiz_type.answers.create!(value: a[:answer], target_stage_number: a[:target_stage_number], contents: a[:answer_content])
          if a[:answer] == "[실패]"
            answer.update(value: "", answer_type: "failure")
            quiz_type.update(chance_count: 1)
          else
            answer.update(answer_type: "pass") if (a[:answer].tr("₩₩^*#", "").empty? rescue false)
          end
        end

        # Hints
        next unless stage.quiz?

        hints = []
        make_hint = ->(contents, image_url, answer) {
          return nil if (contents.nil? or contents.empty?) and (image_url.nil? or image_url.empty?)
          hint = Hash.new
          hint[:contents] = contents if contents
          hint[:hint_type] = 1 if answer
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
        hints << make_hint[v[@keys[:hint1_contents]], v[@keys[:hint1_image_path]], false]
        hints << make_hint[v[@keys[:hint2_contents]], v[@keys[:hint2_image_path]], false]
        hints << make_hint[v[@keys[:hint3_contents]], v[@keys[:hint3_image_path]], true]
        hints.compact!
        hints.each_with_index do |h, index|
          hint = quiz_type.hints
            .create!(
              contents: h[:contents] ? h[:contents] : "", 
              hint_number: (h[:hint_number].nil? or h[:hint_number].empty?) ? (index + 1) : h[:hint_number].to_i, 
              hint_type: h[:hint_type] ? :answer : :hint
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