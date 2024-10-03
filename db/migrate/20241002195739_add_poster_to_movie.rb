class AddPosterToMovie < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :poster, :string
  end
end
