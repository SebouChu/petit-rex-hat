class CreateSeasonSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :season_suggestions, id: :uuid do |t|
      t.references :season, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :movie, null: false, foreign_key: true, type: :uuid
      t.datetime :picked_at

      t.timestamps
    end
  end
end
