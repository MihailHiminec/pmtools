module ProjectHelper
  def cost_project_todo
    @todo.sum(:time_spent) * @project.cost_per_hour
  end
  def cost_project_todo_budjet
    @todo.sum(:time_to_complete) * @project.cost_per_hour
  end
  def cost_project_todo_complete
    a = 78
  end
end