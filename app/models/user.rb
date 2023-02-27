class User < ApplicationRecord
    has_many :video_posts
    has_many :comments
    has_many :commented_videos, through: :comments, source: :video
    has_many :liked_videos, through: :video_posts, source: :video

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :sent_friend_requests, class_name: "Friendship", foreign_key: :sender_id, dependent: :destroy
    
    has_many :recieved_friend_requests, class_name: "Friendship", foreign_key: :reciever_id, dependent: :destroy

    def friendships
        friendships = Friendship.where(sender: self, status: "accepted").or(Friendship.where(reciever: self, status: "accepted"))
        friendships.map{|f| f.sender === self ? f.reciever : f.sender}
    end
end
