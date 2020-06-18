module Model::Serializer
  class Theme < Base
    identifier :fake_id, name: :id
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

    view :normal do
      fields :caution
    end
  end
end