class ContractorsController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.all
  end

  # GET /contractor/1
  # GET /contractor/1.json
  def show
    @contractor = Contractor.find(params[:id])
  end

  # GET /contractor/new
  def new
    @contractor = Contractor.new
  end

  # GET /contractor/1/edit
  def edit
  end

  # POST /contractor
  # POST /contractor.json
  def create
    @contractor = current_user.contractors.new(contractor_params)
    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: 'Контрагент добавлен!' }
        format.json { render :show, status: :created, location: @contractor }
      else
        format.html { render :new }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractor/1
  # PATCH/PUT /contractor/1.json
  def update
    respond_to do |format|
      if @contractor.update(contractor_params)
        format.html { redirect_to @contractor, notice: 'Контрагент обновлен!' }
        format.json { render :show, status: :ok, location: @contractor }
      else
        format.html { render :edit }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractor/1
  # DELETE /contractor/1.json
  def destroy
    @contractor.destroy
    respond_to do |format|
      format.html { redirect_to contractor_path, notice: 'Проект удален!' }
      format.json { head :no_content }
    end
  end

  private

  def set_contractor
    @contractor = Contractor.find(params[:id])
  end

  def contractor_params
    params.require(:contractor).permit([ :title, :address, :ogrn, :inn, :kpp ])
  end
end
