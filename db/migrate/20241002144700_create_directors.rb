class CreateDirectors < ActiveRecord::Migration[7.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nationality
      t.date :birth_date
      t.references :genre, null: false, foreign_key: true, default: 0

      t.timestamps
    end
  end
end
