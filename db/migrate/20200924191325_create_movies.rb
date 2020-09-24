class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :genres, array: true, default: []
      t.integer :rating
      t.integer :runtime

      t.timestamps
    end
  end
end
