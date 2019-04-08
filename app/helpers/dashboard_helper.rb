module DashboardHelper
  def set_is_completed_payments
    @payments = Payment.find_by_is_completed(true)
  end
end
