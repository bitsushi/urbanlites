class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :ordinal

      t.timestamps
    end

    add_index :services, :ordinal
  end
end
