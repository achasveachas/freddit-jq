class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :admin, :image_url, :age, :location, :banned
end
