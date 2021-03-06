module ProjectHelper
  def cost_project_todo
    @project.cost_per_hour *  @todo.sum(:time_spent)
  end

  def rel_cost
    @project.cost_per_hour * @todo.sum(:time_to_complete)
  end

  def set_payment_true
    @payments = Payment.where.not(rel_date_payment: '')
    @payments.sum(:cost)
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
    if @the_nearest_pay.blank?
        'Нет оплаты'
      else
        @the_nearest_pay = Russian::strftime(@payment[0].try(:plan_date_payment), "%d %b %y")
    end
    # Russian::strftime(Time.now, '%e %b %H:%M' )
    # payment.try(:rel_date_payment).try(:strftime, ("%d %B %Y"))
  end

  def the_nearest_pay_summ
    @the_nearest_pay_summ = @payment[0].try(:cost)
  end

  def  todo_summ
    @todo.sum(:cost)
  end

  def  payment_summ
    @payment.sum(:cost)
  end
end