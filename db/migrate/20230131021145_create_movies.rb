class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title
      t.string :title_fr
      t.string :director
      t.date :release_date
      t.string :poster_path
      t.string :backdrop_path
      t.bigint :tmdb_identifier

      t.timestamps
    end
  end
end
