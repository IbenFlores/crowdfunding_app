class Api::V1::ProjectsController < ActionController::API

  def index
    projects = Project.all
    render json: {
      status: 'success',
      data: projects.as_json(only: [:id, :title, :description, :goal_amount, :current_amount, :base_currency])
    }, status: :ok
  end

  def show
    project = Project.find_by(id: params[:id])
    
    if project
      render json: { status: 'success', data: project }, status: :ok
    else
      render json: { status: 'error', message: 'Proyecto no encontrado' }, status: :not_found
    end
  end
end