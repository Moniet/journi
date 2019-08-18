class AuthController < ApplicationController
    skip_before_action :authenticate

    def create
        user = User.find_by(username: auth_params[:username])
        if user && user.authenticate(auth_params[:password])
            token = encode_token(user.id)
            render json: { jwt: token }
        else 
            render json: { error: 'Inavlid username / password' }
        end
    end

    private

    def auth_params
        params.require(:user).permit(:username, :password)
    end
end
