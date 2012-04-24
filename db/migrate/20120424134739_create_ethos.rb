class CreateEthos < ActiveRecord::Migration
  def change
    create_table :ethoses do |t|
      t.string :headline
      t.text :description
      t.integer :ordinal

      t.timestamps
    end

    add_index :ethoses, :ordinal
  end
end
