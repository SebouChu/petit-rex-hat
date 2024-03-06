class UpdateSeasonStatuses < ActiveRecord::Migration[7.0]
  def change
    Season.where(status: 0).update_all(status: 10)
    Season.where(status: 2).update_all(status: 20)
    change_column_default :seasons, :status, from: 0, to: 10
  end
end
