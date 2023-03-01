class VideoPostSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :video
end
