class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :uid
      # t.string :url
      t.integer :project_id
      t.text :description
      t.integer :duration
      t.datetime :published_at
      t.string :state
      t.integer :width
      t.integer :height
    end

    add_index :videos, :project_id
    add_index :videos, :uid, unique: true
    add_index :videos, :published_at
  end
end
