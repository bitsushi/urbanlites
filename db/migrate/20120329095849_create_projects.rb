class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :slug
      t.string :name
      t.string :who
      t.string :where
      t.string :what
      t.date :when
      t.text :equipment_used

      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, :when
  end
end
