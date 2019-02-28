class AddDefaultValueCostAndTimeToProjects < ActiveRecord::Migration[5.2]
  def change
    change_column_default :projects, :cost_per_hour, from: '', to: '0'
  end
end
