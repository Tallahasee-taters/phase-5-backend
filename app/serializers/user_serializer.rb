class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :username, :email, :friends, :pending_friend_requests, :avatar_url
  has_many :liked_videos
  has_many :comments
  has_many :sent_friend_requests
  has_many :recieved_friend_requests
  has_many :videos
  
  def pending_friend_requests
    self.object.recieved_friend_requests.pending.map{|req| {id: req.id, sender: req.sender, reciever: req.reciever}}
  end

end
