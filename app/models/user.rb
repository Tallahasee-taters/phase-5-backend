class User < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_secure_password

    has_many :video_posts 
    has_many :comments
    has_many :commented_videos, through: :comments, source: :video
    has_many :liked_videos, through: :video_posts, source: :video
    has_many :videos 

    has_one_attached :avatar

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: {minimum: 7}, on: :create

    has_many :sent_friend_requests, class_name: "Friendship", foreign_key: :sender_id, dependent: :destroy
    
    has_many :recieved_friend_requests, class_name: "Friendship", foreign_key: :reciever_id, dependent: :destroy

    def avatar_url
        if self.avatar.attached?
          rails_blob_url(self.avatar)
        end
    end

    def friends
        friendships = Friendship.where(sender: self, status: "accepted").or(Friendship.where(reciever: self, status: "accepted"))
        friendships.map{|f| f.sender === self ? f.reciever : f.sender}
    end

    def pending_friends
        pending = Friendship.where(sender: self, status: "pending").or(Friendship.where(receiver: self, status: "pending"))
        pending.map{|f| f.sender === self ? f.receiver : f.sender}
    end

    def rejected_friends
        rejected = Friendship.where(sender: self, status: "rejected").or(Friendship.where(receiver: self, status: "rejected"))
        rejected.map{|f| f.sender === self ? f.receiver : f.sender}
    end

    
end
