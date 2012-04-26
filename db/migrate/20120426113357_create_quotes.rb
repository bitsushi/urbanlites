class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :project
      t.text :body
      t.string :author
      t.string :organisation
      t.integer :ordinal
      t.timestamps
    end

    add_index :quotes, :project_id
    add_index :quotes, :ordinal
  end
end
