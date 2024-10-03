class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :release_year
      t.string :synopse
      t.string :country_of_origin
      t.integer :length
      t.integer :release_status
      t.integer :status
      t.references :genre, null: false, foreign_key: true, default: 0
      t.references :director, null: false, foreign_key: true, default: 0

      t.timestamps
    end
  end
end
