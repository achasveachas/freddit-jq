class Conversation < ApplicationRecord
  belongs_to :user
  validates :topic, :post, presence: true
  has_many :comments, as: :commentable

  def self.sort_by_last_edited
    sorted_array = self.all.sort_by do |convo|
      convo.comments.last.created_at
    end
    sorted_array.reverse
  end
end
