module Model::Serializer
  class Track < Base
    view :base do
      fields  :play_id,
              :stage_list_id,
              :wrong_answer_count,
              :used_hint_count,
              :used_answer_count
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
      association :stage_list, blueprint: StageList, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end