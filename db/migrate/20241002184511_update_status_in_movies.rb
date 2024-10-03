class UpdateStatusInMovies < ActiveRecord::Migration[7.2]
  def change
    change_column :movies, :status, :integer, default: 0
  end
end
