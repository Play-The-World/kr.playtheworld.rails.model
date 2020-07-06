module Model::RenderType
  class Text < Base
    def a
      puts "test"
    end

    def str; "text" end
  end
end