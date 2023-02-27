class FriendshipSerializer < ActiveModel::Serializer
  attributes :id
  has_one :reciever
  has_one :sender
end
