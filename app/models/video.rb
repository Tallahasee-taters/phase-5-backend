class Video < ApplicationRecord
    has_many :video_posts
    has_many :users, through: :video_posts
end
