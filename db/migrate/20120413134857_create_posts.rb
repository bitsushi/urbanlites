class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type, limit: 50
      t.string :service_id, limit: 50
      t.text :content
      t.string :url, limit: 100
      t.datetime :posted_at
      t.boolean :visible, default: true
    end

    add_index :posts, [:type,:service_id], unique: true
    add_index :posts, :posted_at
  end
end
