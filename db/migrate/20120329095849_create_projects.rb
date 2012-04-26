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
      t.integer :ordinal, default: 999
      t.integer :window_ordinal, default: 0
      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, :ordinal
    add_index :projects, :when
    add_index :projects, :window_ordinal
  end
end
