class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :topic
  has_many :comments, include_nested_associations: true
  belongs_to :user
end
