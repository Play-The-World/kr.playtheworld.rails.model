module Model
  module Answer
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.answer.table_name

      # Relations
      belongs_to :stage_list_type
      has_many :branches, dependent: :destroy

      def wrong? false; end
      def correct? !wrong?; end

      # 접근 가능한 가지 => Branch?
      def reachable_branch
        branches.each do |branch|
          return branch if branch.reachable?
        end and nil
      end
    end
  end
end
