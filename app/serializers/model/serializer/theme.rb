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
            :has_caution,
            :caution,
            :caution_bold,
            :play_user_count,
            :has_deadline,
            :deadline,
            :is_rankable,
            :is_reviewable,
            :start_address,
            :start_position,
            :difficulty,
            :render_type,
            :price,
            :play_time,
            :data_size,
            :use_memo,
            :need_agreement
            
            # :current_version

    view :images do
      association :images, blueprint: Image
    end

    view :making do
      fields :current_version
    end

    view :making_detail do
      include_view :making
      include_view :images
      # association :images, blueprint: Image
    end
  end
end