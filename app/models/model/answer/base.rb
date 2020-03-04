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
      # Table Name
      self.table_name = Model.config.answer.table_name

      # Relations
      belongs_to :stage_list_type
      has_many :branches, dependent: :destroy, foreign_key: "answer_id"

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

      # 접근 가능한 가지를 찾습니다.
      #
      # ==== Return
      #
      # * Branch?
      def reachable_branch
        branches.each do |branch|
          return branch if branch.reachable?
        end and nil
      end

      def self.serializer
        Model::Serializer::Answer
      end
    end
  end
end
