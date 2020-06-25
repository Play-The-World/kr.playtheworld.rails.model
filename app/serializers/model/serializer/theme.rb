module Model::Serializer
  class Theme < Base
    identifier :fake_id, name: :id
    
    field :title do |t|
      t.super_theme.title
    end

    fields  :type,
            :status,
            :theme_type,
            :content,
            :caution,
            :caution_bold,
            :play_user_count,
            :deadline,
            :is_rankable,
            :is_reviewable,
            :start_address,
            :start_position,
            :difficulty,
            :render_type,
            :price,
            :play_time,
            :data_size
            # :current_version

    view :making do
      fields :current_version
    end

    view :making_detail do
      include_view :making
      association :images, blueprint: Image
      fields :has_caution, :need_agreement, :has_deadline
    end
  end
end