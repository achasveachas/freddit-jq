class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :user
  has_many :comments
end
