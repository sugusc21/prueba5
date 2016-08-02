class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :duration
      t.string :genre_id

      t.timestamps null: false
    end
  end
end
