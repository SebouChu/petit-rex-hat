class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons, id: :uuid do |t|
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
