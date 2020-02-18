module Model::Seeder::V1
  class Event < Base
    KEYS = {
      type: "이벤트 유형",
      id: "이벤트 ID",
      value1: "값 1",
      value2: "값 2"
    }
    attr_reader :events

    def initialize(values)
      super(values)

      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
      @events = {}
    end

    def seed
      if @theme.nil?
        puts "Set Theme first !"
        return
      end
      puts "Create Events"
      @values.each_with_index do |v, i|
        next if i == 0
        if v[@keys[:id]].nil?
          puts "[WARN] Set Event ID first ! (row: #{i + 1})"
          next
        end

        case v[@keys[:type]]
        # when "아이템 습득"
        #   item = Item.find_by(title: v[@keys[:value1]])
        #   if item.nil?
        #     puts "[WARN] Unknown Item(title: #{v[@keys[:value1]]})."
        #     next
        #   end
        #   in_theme = item.items_in_themes.find_by(theme_id: @theme.id)
        #   if in_theme.nil?
        #     puts "[WARN] Unknown Item(title: #{v[@keys[:value1]]}) in Theme(title: #{@theme.title})."
        #     next
        #   end
        #   @events[v[@keys[:id]].to_s] = @theme.events
        #     .create!(
        #       event_type: :get_item,
        #       value: in_theme.id.to_s
        #     )
        when "업적 획득"
          a = Achievement.find_by(title: v[@keys[:value1]].to_s)
          if a.nil?
            puts "[WARN] Unknown Achievement(title: #{v[@keys[:value1]]})."
            next
          end
          condition_contents = v[@keys[:value2]] and !v[@keys[:value2]].empty? ? v[@keys[:value2]] : nil
          @events[v[@keys[:id]].to_s] = Model::Application.current
            .events << Model::Event::GetAchievement.create!(
              value1: a.id.to_s,
              value2: condition_contents
            )
        else
          puts "[WARN] Unknown EventType #{v[@keys[:type]]}."
          next
        end
      end
      
      self
    end
  end
end