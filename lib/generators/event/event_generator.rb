class EventGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  def create_condition_file
    create_file(
      "app/models/model/event/#{file_name}.rb", 
      <<-FILE
module Model::Event # :nodoc:
  #
  # #{file_name.camelize} 이벤트 클래스
  # TODO 이벤트에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * EventGroup
  # * Target(polymorphic)
  #
  class #{file_name.camelize} < Base
    # 실행
    def trigger
      # do something
      # ...
    end
  end
end
      FILE
    )
  end
end