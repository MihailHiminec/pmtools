class AddDefaultValueBudgetToProjects < ActiveRecord::Migration[5.2]
  def change
    change_column_default :projects, :budget, from: '', to: '0'
  end
end
