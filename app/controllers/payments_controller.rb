class PaymentsController < ApplicationController
  require 'csv'
  before_action :current_user, only: [:new, :destroy, :show, :edit, :update]
  before_action :set_project


  def index
    @payments = @set_project.payments
    respond_to do |format|
      format.html
      format.csv { send_data @payment.to_csv, content_type: 'text/csv' }
     end
  end

  def new
    @payment = Payment.new
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(payment_params)
      redirect_to project_path(set_project),
                  notice: "Счет № #{@payment.invoice_number} обновлен!"
    else
      render 'edit'
    end
  end

  def create
    @payment = set_project.payments.new(payment_params)
    @payment.user = current_user
    if @payment.save
      redirect_to project_path(set_project),
                  notice: "Счет № #{@payment.invoice_number} успешно создан!"
    else
      render action: 'new'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    if @payment.destroy
      redirect_to project_path(set_project),
                notice: "Счет № #{@payment.invoice_number} удален!"
    else
      render action: 'new'
    end
  end

  private
  def set_project
    @set_project = Project.find(params[:project_id])
  end
  def payment_params
    params.require(:payment).permit([ :invoice_number, :invoice_discription, :user_id, :project_id, :is_completed, :cost, :plan_date_payment, :rel_date_payment ])
  end
end
