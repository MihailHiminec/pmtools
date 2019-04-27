class FinanceController < ApplicationController
  def index
    @payment = Payment.all
  end
end
