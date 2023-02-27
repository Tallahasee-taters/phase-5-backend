class CreateVideoPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :video_posts do |t|
      t.string :header
      t.references :user, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true
      t.references :comments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
