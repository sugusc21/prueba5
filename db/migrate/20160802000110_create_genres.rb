class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
