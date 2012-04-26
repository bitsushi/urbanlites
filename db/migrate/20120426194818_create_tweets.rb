class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :media
      t.string :uid, limit: 40
      t.string :url
      t.datetime :posted_at
    end

    add_index :tweets, :uid, unique: true
    add_index :tweets, :posted_at
  end
end
