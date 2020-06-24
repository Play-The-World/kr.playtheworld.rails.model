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
  end
end