class VideoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :upvote, :downvote, :header, :thumbnail_url, :video_url, :featured_image
  has_one :user
  has_many :comments
  
  def featured_image
    if object.featured_image.attached?
      {
        url: rails_blob_url(object.featured_image)
      }
    end
  end
end
