class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  has_one :video
  has_one :user
end
