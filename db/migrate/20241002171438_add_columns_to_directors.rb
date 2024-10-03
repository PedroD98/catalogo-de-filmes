class AddColumnsToDirectors < ActiveRecord::Migration[7.2]
  def change
    add_column :directors, :biography, :string
  end
end
