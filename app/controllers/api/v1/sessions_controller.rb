class Api::V1::SessionsController < ActionController::API
  def create
    user = User.find_by(email_address: params[:email])
    
    if user&.authenticate(params[:password])
      token = JwtService.encode(user_id: user.id)
      render json: { 
        status: 'success',
        token: token, 
        user: user.email_address 
      }, status: :ok
    else
      render json: { error: 'Credenciales inválidas' }, status: :unauthorized
    end
  end
end