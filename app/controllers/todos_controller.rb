class TodosController < ApplicationController
  require 'csv'
  before_action :current_user, only: [:new, :destroy, :show, :edit, :update]
  before_action :set_project


  def index
    @todo = @set_project.todos
    respond_to do |format|
      format.html
      format.csv { send_data @todo.to_csv, content_type: 'text/csv' }
     end
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to project_path(set_project),
                  notice: 'Задача обновлена!'
    else
      render 'edit'
    end
  end

  def create
    @todo = set_project.todos.new(todo_params)
    @todo.user = current_user
    if @todo.save
      redirect_to project_path(set_project),
                  notice: 'Задача добавлена!'
    else
      render action: 'new'
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      redirect_to project_path(set_project),
                notice: 'Задача удалена!'
    else
      render action: 'new'
    end
  end

  private
  def set_project
    @set_project = Project.find(params[:project_id])
  end
  def todo_params
    params.require(:todo).permit([ :title, :discription, :user_id, :project_id, :isCompleted, :time_spent, :cost, :time_to_complete, :priority ])
  end
end
