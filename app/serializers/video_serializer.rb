class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :upvote, :downvote, :video_url #:featured_image
  has_one :user
  has_many :comments
end
