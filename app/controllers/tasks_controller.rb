class TasksController < ApplicationController
	before_action :authenticate_user!
	
	def edit
      @project = Project.find(params[:project_id])	
	  @task = @project.tasks.find(params[:id])
	end

	def create
	  @project = Project.find(params[:project_id])	
	  @task = @project.tasks.create(task_params)
	  redirect_to project_path(@project)
	end

	def update
	  @project = Project.find(params[:project_id])	
	  @task = @project.tasks.find(params[:id])

	  if @task.update(task_params)
	  redirect_to project_path(@project)
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
	  	params.require(:task).permit(:name, :status)
	  end
end
