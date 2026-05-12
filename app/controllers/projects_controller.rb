class ProjectsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end