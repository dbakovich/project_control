class UsersController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @user = @task.users.create(user_params)
    if @task.save
      redirect_to @project
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
  end
end
