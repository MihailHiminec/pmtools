class ProjectsController < ApplicationController
  before_action :current_user, only: [:destroy, :show]

  def index
    @projects = Project.order(id: :desc).all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
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
    redirect_to subdomain_root_url,
                notice: 'Проект удален!'
    else
      render action: 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:title)
  end
end
