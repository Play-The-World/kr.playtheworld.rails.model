module Model
  class Coordinate < ApplicationRecord
    # Relations
    belongs_to :coordinatable, polymorphic: true

    # Enums
    include Enumerize
    enumerize :coordinate_type, in: %i(map), default: :map

    # Callbacks
    before_create :convert_coordinate

    private
      def convert_coordinate
        x1 = self.x
        y1 = self.y

        if x1 > 200 and y1 > 200
          url = "https://dapi.kakao.com/v2/local/geo/transcoord.json?x=#{x1}&y=#{y1}&input_coord=WCONGNAMUL&output_coord=WGS84"
          params = {
            "x": x1,
            "y": y1,
            "input_coord": "WCONGNAMUL"
          }
          # res = JSON.parse(RestClient.get(url, headers={"Authorization": "KakaoAK #{Configs::App::KAKAO_REST_API_KEY}"}))
          res = JSON.parse(RestClient.get(url, headers={"Authorization": "KakaoAK 2b398a5bc6ee4685d71306db90ff9d71"}))
          self.x = res["documents"].first["x"]
          self.y = res["documents"].first["y"]
          # puts "WCONGNAMUL coordinate Converted to #{self.x}, #{self.y}"
        end
      end
  end
end
