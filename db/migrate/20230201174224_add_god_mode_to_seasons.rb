class AddGodModeToSeasons < ActiveRecord::Migration[7.0]
  def change
    add_column :seasons, :god_mode, :boolean, default: false
  end
end
