class AddBackgroundImageToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :background, :string
  end
end
