class Conversation < ApplicationRecord
  belongs_to :user
  validates :topic, presence: true
end
