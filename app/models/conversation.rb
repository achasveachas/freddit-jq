class Conversation < ApplicationRecord
  belongs_to :user
  validates :topic, :post, presence: true
end
