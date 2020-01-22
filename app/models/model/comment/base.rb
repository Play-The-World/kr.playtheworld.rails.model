module Model
  module Comment
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.comment.table_name

      # Relations
      belongs_to :board, class_name: Model.config.board.class_name
      include Model::Commentable
      belongs_to :commenter, polymorphic: true
    end
  end
end
