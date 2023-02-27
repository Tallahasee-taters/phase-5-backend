class Friendship < ApplicationRecord
  belongs_to :reciever, class_name "User"
  belongs_to :sender, class_name "User"

  validates :status, inclusion: {in: ["pending", "accepted", "rejected"], message: "%{value} has to be one of pending, accepted, or rejected"}

  scope :pending, -> {where("staus = ?", "pending")}
  scope :accepted, -> {where("staus = ?", "accepted")}
  scope :rejected, -> {where("staus = ?", "rejected")}
end
