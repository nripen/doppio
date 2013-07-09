class ProjectsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :desroy] 
  before_filter :admin_user, only: [:index, :edit, :update, :desroy]

  include ProjectsHelper
  


  def index
    if current_user.admin?
  	   @projects = Project.all
     end
  end

  def new
  	@project = Project.new
    respond_to do |format|               
      format.js
    end
  end

  def create
  	@project = Project.new(params[:project])
  	if @project.save
      populate_issue_types @project
  		redirect_to @project
  	else
  		render 'new'
  	end
  end

  def show
  	@project = Project.find(params[:id])
    @issues = @project.issue_types.all
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
	  @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      # Handle a successful update
      flash[:success] = "Project updated."
      # sign_in @user
      redirect_to @project
    else
      render 'edit'
    end
  end
  
  def destroy
  	Project.find(params[:id]).destroy
  	flash[:success] = "Project destroyed."
    redirect_to projects_url
  end

  def substantive_content
    respond_to do |format|               
      format.js
    end        
  end 

  def donot_know
    @project = Project.find(params[:id])
    @issues = @project.issue_types.all
    respond_to do |format|               
      format.js
    end  
  end

  def issues
    @project = Project.find(params[:id])
    @issue_types = @project.issue_types.all
    respond_to do |format|               
      format.js
    end  
  end

  def new_issue
    @project = Project.find(params[:id])
    @issue_type = @project.issue_types.build
    respond_to do |format|               
      format.js
    end
  end

  private

    def admin_user
      redirect_to (root_path) unless current_user.admin?
    end
  
end
