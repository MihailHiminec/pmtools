module ProjectHelper
  def cost_project_todo
    @cost_hour = @todo.sum(:cost) * @todo.sum(:time_spent)
  end
  def rel_cost_project_todo
    @rel_cost_hour = @todo.sum(:cost) * @todo.sum(:time_to_complete)
  end
  def time_to_complete_summ
    @todo.sum(:time_to_complete)
  end
  def time_spent_summ
    @todo.sum(:time_spent)
  end
  def cost_project_todo_complete
    a = 78
  end
  def the_nearest_pay
    @the_nearest_pay = @payment[0].try(:plan_date_payment)
    # Russian::strftime(Time.now, '%e %b %H:%M' )
    # payment.try(:rel_date_payment).try(:strftime, ("%d %B %Y"))
  end
  def the_nearest_pay_summ
    @the_nearest_pay_summ = @payment[0].try(:cost)
  end
  def  todo_summ
    @todo.sum(:cost)
  end
end