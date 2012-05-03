class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name
      t.string :description
      t.string :file
      t.integer :ordinal

      t.timestamps
    end

    add_index :downloads, :ordinal
  end
end
