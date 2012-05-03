class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :slug
      t.string :name
      t.string :who
      t.string :where
      t.date :when
      t.string :what
      t.text :description
      t.integer :ordinal
      t.integer :window_ordinal, default: 0
      t.integer :photos_count
      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, :ordinal
    add_index :projects, :when
    add_index :projects, :window_ordinal
  end
end
