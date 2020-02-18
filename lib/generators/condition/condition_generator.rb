class ConditionGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_condition_file
    create_file(
      "app/models/model/condition/#{file_name}.rb", 
      <<-FILE
module Model::Condition # :nodoc:
  #
  # #{file_name.camelize} 조건 클래스
  # TODO 조건에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * Conditionable(polymorphic)
  #
  # ==== has_many
  # 
  # * ConditionClear
  class #{file_name.camelize} < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      # TODO 조건 명세
      true
    end

    # 조건을 만족했다는 것을 표시하는 함수
    # (ex. ConditionClear를 생성)
    def clear!
      
    end
  end
end
      FILE
    )
  end
end
