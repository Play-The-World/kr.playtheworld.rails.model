module Model::Serializer
  class StageList < Base
    view :base do
      fields  :theme_data_id,
              :number,
              :title,
              :type
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
      field :game_component do |a|
        a.game_component.as_json
      end
      fields :answer_lengths

      field :answers do |a|
        case a.game_component.type
        # when 'Choice1'
        #   a.answers.map do |answer|
        #     answer.converted_values.map do |cv|
        #       {
        #         stage_list_id: a.id,
        #         value: answer.value,
        #         content: cv
        #       }
        #     end
        #   end.flatten.uniq
        when 'Choice1', 'Script1'
          a.answers.map do |answer|
            answer.converted_contents.map do |cv|
              {
                stage_list_id: a.id,
                value: answer.value,
                content: cv
              }
            end
          end.flatten.uniq
        else
          []
        end
      end

      field :hints_count do |a|
        a.hints.size
      end

      association :stages, blueprint: Stage, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end