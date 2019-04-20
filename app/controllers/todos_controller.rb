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
    @todo = Todo.find params[:id]

    respond_to do |format|
      if @todo.update_attributes(todo_params)
        format.html { redirect_to(project_todo_path, :notice => 'Обновлено') }
        format.json { respond_with_bip(@todo) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@todo) }
      end
    end
  end

  def create
    @todo = set_project.todos.new(todo_params)
    @todo.user = current_user
    respond_to do |format|
      if @todo.save
        format.html { redirect_to set_project, notice: 'Задача добавлена!' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
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
    params.require(:todo).permit([ :title, :discription, :user_id, :project_id, :deadline, :isCompleted, :time_spent, :cost, :time_to_complete, :priority, :implementer ])
  end
end
