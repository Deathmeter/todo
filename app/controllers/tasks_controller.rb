class TasksController < ApplicationController
	def create
	  @project = Project.find(params[:project_id])	
	  @task = @project.tasks.create(task_params)
	  redirect_to project_path(@project)
	end

	def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to projects_path
  end

	private
	  def task_params
	  	params.require(:task).permit(:name, :status)
	  end
end
