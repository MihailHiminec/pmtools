class AddCostPerHourToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :cost_per_hour, :integer
  end
end
