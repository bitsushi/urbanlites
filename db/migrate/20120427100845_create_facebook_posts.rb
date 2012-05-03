class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.string :uid
      t.string :url
      t.datetime :posted_at
      t.text :content
    end

    add_index :facebook_posts, :uid, unique: true
    add_index :facebook_posts, :posted_at
  end
end
