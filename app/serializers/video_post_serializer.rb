class VideoPostSerializer < ActiveModel::Serializer
  attributes :id, :header
  has_one :user
  has_one :video
  has_one :comment
end
