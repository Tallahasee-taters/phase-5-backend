class Video < ApplicationRecord
    has_many :video_posts
    has_many :comments
    belongs_to :user
end
