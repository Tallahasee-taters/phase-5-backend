class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :upvote, :downvote
end
