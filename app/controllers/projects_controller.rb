class ProjectsController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.order(id: :desc).all
    @search = ProjectSearch.new filters: params[:f]
    @payments = Payment.order(id: :desc).all
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
    @todo = @project.todos.order(id: :desc).all
    @payment = @project.payments.order(id: :desc).all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Проект добавлен!' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if set_project.update_attributes(project_params)
        format.html { redirect_to(set_project, :notice => 'Обновлено') }
        format.json { respond_with_bip(set_project) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(set_project) }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @projects.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Проект удален!' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit([:title, :description, :budget, :cost_per_hour, :user_id, :contractor_id])
  end
end
