class TasksController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
  end

  def edit
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
