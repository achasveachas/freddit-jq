class Conversation < ApplicationRecord
  belongs_to :user
  validates :topic, :post, presence: true
  has_many :comments, as: :commentable
end
