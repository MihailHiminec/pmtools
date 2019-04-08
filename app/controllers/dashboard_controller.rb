class DashboardController < ApplicationController
  def index
    @projects = Project.all
    @payments = Payment.all
  end
end
