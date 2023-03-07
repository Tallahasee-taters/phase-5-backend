class User < ApplicationRecord
    has_secure_password

    has_many :video_posts
    has_many :comments
    has_many :commented_videos, through: :comments, source: :video
    has_many :liked_videos, through: :video_posts, source: :video
    has_many :videos 

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: {minimum: 7}

    has_many :sent_friend_requests, class_name: "Friendship", foreign_key: :sender_id, dependent: :destroy
    
    has_many :recieved_friend_requests, class_name: "Friendship", foreign_key: :reciever_id, dependent: :destroy

    def friends
        friendships = Friendship.where(sender: self, status: "accepted").or(Friendship.where(reciever: self, status: "accepted"))
        friendships.map{|f| f.sender === self ? f.reciever : f.sender}
    end
end
