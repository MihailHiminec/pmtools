class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = Project.find(params[:id])
  end
end
