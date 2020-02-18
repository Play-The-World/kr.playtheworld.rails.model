module Model::Seeder::V1
  class Maker < Base
    KEYS = {
      maker_type: "제작자 유형",
      maker_name: "제작자 이름"
    }

    def initialize(values)
      super(values)

      @values = values
      @keys = Hash.new
      KEYS.each do |k, v|
        @keys[k] = values[0].index(v)
      end
      @keys.each { |k, v| puts "[WARN] #{k} is not defined." if v.nil? }
    end

    def seed
      if @theme.nil?
        puts "Set Theme first !"
        return
      end
      puts "Create Makers"
      @values.each_with_index do |v, i|
        next if i == 0
        # next if v[@keys[:maker_type]].nil? or v[@keys[:maker_type]].empty?
        # @theme.makers << Maker.find_or_create_by!(
        #   maker_type: v[@keys[:maker_type]],
        #   name: v[@keys[:maker_name]]
        # ) rescue next
      end

      self
    end
  end
end