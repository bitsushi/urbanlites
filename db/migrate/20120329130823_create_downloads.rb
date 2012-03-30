class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name
      t.string :description
      t.string :file

      t.timestamps
    end
  end
end
