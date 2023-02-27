class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
