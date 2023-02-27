class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :friends
  has_many :sent_friend_requests
  has_many :recieved_friend_requests
end
