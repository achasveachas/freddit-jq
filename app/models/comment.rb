class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :conversation, foreign_key: :ancestor_id
  has_many :comments, as: :commentable

  after_create :update_ancestor_sort_column, :set_ancestor



  private

  def set_ancestor
    current_child = self

    until current_child.commentable_type == "Conversation"
      current_child = current_child.commentable
    end

    self.ancestor_id = current_child.commentable_id
  end

  def update_ancestor_sort_column

  end

end
