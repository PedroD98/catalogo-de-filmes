class AddColmunToGenre < ActiveRecord::Migration[7.2]
  def change
    add_column :genres, :description, :string
  end
end
