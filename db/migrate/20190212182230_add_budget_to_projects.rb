class AddBudgetToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :budget, :integer
  end
end
