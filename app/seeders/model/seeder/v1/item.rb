module Model::Seeder::V1
  class Item < Base
    KEYS = {
      title: "아이템 이름",
      contents: "아이템 설명",
      in_image_url: "아이템 경로 (In)",
      out_image_url: "아이템 경로 (Out)",
      count: "개수"
    }
    attr_reader :items

    def initialize(values)
      super(values)

      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
      @items = []
    end

    def seed
      if @theme.nil?
        puts "Set Theme first !"
        return
      end
      puts "Create Items"
      @values.each_with_index do |v, i|
        next if i == 0
        count = v[@keys[:count]].to_i rescue 0

        # Item
        item = Model::Item.find_or_create_by!(
          title: v[@keys[:title]],
          contents: v[@keys[:contents]]
        )

        # Out Image
        item.images.where(
          store_type: :external,
          value: "#{@base_url}#{v[@keys[:out_image_url]]}"
        ).first_or_create!
        
        # Theme Item
        in_theme = @theme.items_in_themes
          .find_or_create_by!(
            item_id: item.id,
            is_permanent: count == 0,
            count: count
          )

        # In Image
        in_theme.events.create!(
          event_type: "image",
          value: "#{@base_url}#{v[@keys[:in_image_url]]}"
        )
        
        @items << in_theme
      end

      self
    end
  end
end