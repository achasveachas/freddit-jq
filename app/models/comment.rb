class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :conversation, as: :ancestor
  has_many :comments, as: :commentable

  after_create :update_parent_sort_column, :set_ancestor



  private

  def update_parent_sort_column

  end

end
