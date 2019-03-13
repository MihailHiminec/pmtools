class ProjectsController < ApplicationController
  before_action :current_user, only: [:destroy, :show, :edit, :update]

  def index
    @projects = Project.order(id: :desc).all
    @search = ProjectSearch.new filters: params[:f]
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @todo = @project.todos.order(id: :desc).all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path,
                  notice: 'Проект обновлен!'
    else
      render 'edit'
    end
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to subdomain_root_url,
                  notice: 'Проект добавлен!'
    else
      render action: 'new'
    end
  end

  def destroy
    projects = Project.find(params[:id])
    if projects.destroy
    redirect_to projects_path,
                notice: 'Проект удален!'
    else
      render action: 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit([ :title, :description, :budget, :cost_per_hour ])
  end
end
