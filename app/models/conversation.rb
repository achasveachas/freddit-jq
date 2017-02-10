class Conversation < ApplicationRecord
  belongs_to :user
  validates :topic, presence: true
  has_many :comments, as: :commentable, :dependent => :destroy
  before_create :init_sort_column

  private

  def init_sort_column
    self.sort_column = self.created_at || Time.now
  end


end
