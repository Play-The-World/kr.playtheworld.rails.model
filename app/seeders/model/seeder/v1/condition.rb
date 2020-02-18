module Model::Seeder::V1
  class Condition < Base
    KEYS = {
      event_id: "대상 이벤트 ID",
      type: "조건 유형",
      value1: "값 1",
      value2: "값 2"
    }
    attr_reader :conditions
    attr_accessor :events

    def initialize(values)
      super(values)

      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
      @conditions = []
    end

    def seed
      if @theme.nil?
        puts "[FATAL] Set Theme first !"
        return
      end
      if @events.nil?
        puts "[FATAL] Set Events first !"
        return
      end
      puts "Create Conditions"
      @values.each_with_index do |v, i|
        next if i == 0

        if v[@keys[:event_id]].nil?
          puts "[WARN] Event ID is not defined! (row: #{i + 1})"
          next
        end

        event = @events[v[@keys[:event_id]].to_s]
        if event.nil?
          puts "[WARN] Event not found! (row: #{i + 1})"
          next
        end

        case v[@keys[:type]]
        when "해당 스테이지 시작 시"
          event.conditions << Model::Condition::StageStart.new(
            value: "#{v[@keys[:value1]]}"
          )
        # when "해당 스테이지 완료 시"
        #   event.conditions.create!(
        #     condition_type: :did_stage,
        #     value: "#{@theme.id}",
        #     extra_value: "#{v[@keys[:value1]]}"
        #   )
        # when "후기 작성"
        #   event.conditions.create!(
        #     condition_type: :review_on_theme,
        #     value: "#{@theme.id}"
        #   )
        # when "N번째로 후기 작성"
        #   event.conditions.create!(
        #     condition_type: "nth_review_on_theme",
        #     value: "#{@theme.id}",
        #     extra_value: "#{v[@keys[:value1]]}"
        #   )
        # when "플레이 완료"
        #   if v[@keys[:value1]]
        #     target_theme = SuperTheme.find_by(title: "#{v[@keys[:value1]]}").theme rescue nil
        #   end
        #   target_theme = @theme if target_theme.nil?
        #   event.conditions.create!(
        #     condition_type: "after_play",
        #     value: "#{target_theme.id}"
        #   )
        # when "해당 스테이지 완료"
        #   event.conditions.create!(
        #     condition_type: "did_stage",
        #     value: "#{@theme.id}",
        #     extra_value: "#{v[@keys[:value1]]}"
        #   )
        # when "해당 엔딩으로 완료"
        #   event.conditions.create!(
        #     condition_type: "after_ending",
        #     value: "#{@theme.id}",
        #     extra_value: "#{v[@keys[:value1]]}"
        #   )

        else
          puts "[WARN] Unknown ConditionType #{v[@keys[:type]]}."
          next
        end
      end

      self
    end

    def set_events(events)
      @events = events
      self
    end
  end
end