class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :friends
  has_many :liked_videos
  has_many :comments
  has_many :sent_friend_requests
  has_many :recieved_friend_requests
  has_many :videos

end
