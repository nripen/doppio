class IssueTypesController < ApplicationController
  
  def index
  	@project = Project.find(params[:project_id])
    @issue_types = @project.issue_types.all
  end
  
  def new
    @project = Project.find(params[:project_id])
    @issue_type = @project.issue_types.build
    respond_to do |format|               
      format.js
    end
  end
  
  def create
  	@project = Project.find(params[:project_id])
  	@issue_type = @project.issue_types.build(params[:issue_type])
	  if @issue_type.save
	    flash[:success] = "Issue type created!"
      redirect_to :back
	  else
	    flash[:error] = "Issue type is not created!"
      redirect_to :back
	  end
  end

  def edit
    @project = Project.find(params[:project_id])
    @issue_type = @project.issue_types.find(params[:id])
    respond_to do |format|               
      format.js
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @issue_type = @project.issue_types.find(params[:id])
    if @issue_type.update_attributes(params[:issue_type])
      flash[:success] = "Issue type updated!"
      redirect_to :back
    else
      flash[:error] = "Issue type is not updated!"
      #redirect_to :back
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @issue_type = @project.issue_types.find(params[:id])
    @issue_type.destroy
    redirect_to project_issue_types_path(@project)
  end
end
