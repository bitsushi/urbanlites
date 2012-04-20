class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :uid
      t.integer :project_id
      t.text :description
      t.integer :duration
      t.datetime :published_at
      t.string :state
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
