class Api::V1::BaseController < ActionController::API
  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded = JwtService.decode(token)
    
    if decoded
      @current_user = User.find_by(id: decoded[:user_id])
    else
      render json: { error: 'No autorizado. Se requiere Bearer Token válido.' }, status: :unauthorized
    end
  end
end