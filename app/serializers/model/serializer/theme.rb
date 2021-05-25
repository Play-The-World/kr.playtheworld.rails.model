module Model::Serializer
  class Theme < Base
    identifier :fake_id, name: :id

    view :base do
      # field :title do |t|
      #   t.super_theme.title
      # end

      field :difficulty do |t|
        t.difficulty_s
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
              # :difficulty,
              :render_type,
              :price,
              :play_time,
              :data_size,
              :use_memo,
              :need_agreement,
              :super_theme_id
    end

    view :images do
      association :images, blueprint: Image, view: :base
    end

    # 상세 보기 페이지 등.
    view :show do
      include_view :base
      include_view :images
      field :end_stages_count do |a|
        a.end_stages.size
      end
      field :achievements_count do |a|
        a.achievements.size
      end

      # association :super_theme, blueprint: SuperTheme, view: :base
    end

    # 플레이시
    view :play do
      include_view :show
    end

    view :making do
      field :themeTitle do |t|
        t.super_theme.title
      end
      field :content, name: :themeDescription
      field :themeProfile do |t|
        image = t.super_theme.images.find_by(type: :thumbnail)
        {
          fileName: image.filename,
          imageURL: image&.url
        }
      end
      field :themeType do |t|
        t.render_type&.str
      end
      field :play_type, name: :playType
      field :onOffType do |t|
        category = t.super_theme.categories.take
        case category&.type
        when "online"
          "onLine"
        when "offline"
          "offLine"
        else
          nil
        end
      end
      field :addFunction do |t|
        {
          attention: {
            brifEmphasisMessage: t.caution,
            emphasisMessage: t.caution_bold,
            getUserAgree: t.need_agreement,
            isUse: t.has_caution
          },
          dueDate: {
            endDate: t.deadline,
            isUse: t.has_deadline
          },
          infoMessage: {
            message: t.additional_text,
            isUse: t.has_additional_text
          },
          memo: t.use_memo,
          rank: t.is_rankable,
          review: t.is_reviewable
        }
      end
      field :dateOfApplication do |t|
        nil
      end
      field :created_at, name: :dateOfCreate
      field :updated_at, name: :dateOfEdit
      field :genre do |t|
        t.super_theme.genres.take&.title
      end
      field :difficulty_s, name: :level
      field :play_user_count, name: :participant
      field :play_time, name: :playTime
      field :publish do |t|
        {
          alram: t.publish_alert,
          status: "edit",
          type: t.publish_type
        }
      end
      field :numberOfEnding do |t|
        0
      end
      # soundInfo
      field :themeImageInfo do |t|
        images = t.images.where(type: :preview)
        {
          fileNameList: images.map { |i| "??" },
          imageURLList: images.map { |i| i.url }
        }
      end
      field :themePrice do |t|
        {
          freeStage: t.has_teaser_stage,
          # priceType: "free",
          selectPrice: t.price,
          themeType: "simple" # t.price_type
        }
      end
      field :writters do |t|
        c = t.creations
        {
          made: c.select { |a| a.type == :producer }.map(&:creator).map(&:name),
          picture: c.select { |a| a.type == :illustrator }.map(&:creator).map(&:name),
          text: c.select { |a| a.type == :writer }.map(&:creator).map(&:name)
        }
      end
      field :startPosition do |t|
        {
          address: t.start_address,
          description: t.start_position,
          lat: t.coordinate&.lat,
          lng: t.coordinate&.lng
        }
      end
      # itemInfoList
      # achieveList
      # stageInfoList
    end

    view :making_detail do
      include_view :making
    end
  end
end