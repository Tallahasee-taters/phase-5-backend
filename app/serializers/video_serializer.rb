class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :upvote, :downvote, :header, :thumbnail_url, :video_url
  has_one :user
  has_many :comments
end
