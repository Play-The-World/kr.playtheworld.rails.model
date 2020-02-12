module Model
  module Comment 
    #
    # 기본 댓글 클래스
    #
    # == Relations
    #
    # ==== belongs_to
    #
    # * Board
    # * Commenter(polymorphic)
    #
    # ==== has_many
    #
    # * Comment
    #
    # == Status
    # 
    # * +:removed+ - 삭제된 상태
    # * +:blocked+ - 차단된 상태
    #
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.comment.table_name

      # Relations
      belongs_to :board, class_name: Model.config.board.class_name
      include Model::Commentable
      belongs_to :commenter, polymorphic: true

      # Status
      include Model::HasStatus
      set_status %i(removed blocked)
    end
  end
end
