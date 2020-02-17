module Model
  module Board
    #
    # 기본 게시판 클래스
    #
    # == Relations
    #
    # ==== belongs_to
    #
    # * Boardable(polymorphic)
    #
    # ==== has_many
    #
    # * Post
    # 
    # == Translations
    # 
    # * +:title+
    # * +:content+
    #
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.board.table_name

      # Relations
      belongs_to :boardable, polymorphic: true
      has_many :posts, class_name: Model.config.post.class_name, dependent: :destroy, foreign_key: "board_id"

      # Translations
      include Model::Translatable
      translates :title, :content
    end
  end
end
