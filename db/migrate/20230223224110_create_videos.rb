class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :header
      t.string :title
      t.string :thumbnail_url
      t.string :video_url
      t.integer :upvote
      t.integer :downvote
      t.references :user

      t.timestamps
    end
  end
end
