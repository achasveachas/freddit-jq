class Conversation < ApplicationRecord
  belongs_to :user
  validates :topic, presence: true
  validates :comments, presence: true
  has_many :comments, as: :commentable, :dependent => :destroy
  before_create :init_sort_column
  accepts_nested_attributes_for :comments

  private

  def init_sort_column
    self.sort_column = self.created_at || Time.now
  end


end
