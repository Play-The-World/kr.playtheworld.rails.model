module Model
  module Answer
    #
    # 기본 정답 클래스
    #
    # == Relations
    #
    # ==== belongs_to
    #
    # * StageListType
    #
    # ==== has_many
    #
    # * Branch
    #
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.answer.table_name

      # Relations
      belongs_to :stage_list, class_name: Model.config.stage_list.class_name
      # has_many :branches, dependent: :destroy, foreign_key: "answer_id"
      has_many :answers_branches, dependent: :destroy, foreign_key: "answer_id"
      has_many :branches, through: :answers_branches
      include Model::Linkable
      include Model::Interpolatable

      # Enums
      extend Enumerize
      enumerize :value_type, in: %i(default regex), default: :default

      # 틀린 정답인지 확인
      # 
      # ==== Return
      #
      # * Bool
      def wrong?; false end
      # 맞은 정답인지 확인
      # 
      # ==== Return
      #
      # * Bool
      def correct?; !wrong? end

      def converted_values
        [interpolate(value)]
      end
      def converted_contents
        [interpolate(content)]
      end

      # 접근 가능한 가지를 찾습니다.
      #
      # ==== Return
      #
      # * Branch?
      def reachable_branch
        branches.each do |branch|
          return branch if branch.reachable?
        end
        nil
      end

      def branch!
        branches.take
      end

      def self.serializer
        Model::Serializer::Answer
      end
    end
  end
end
