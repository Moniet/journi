class UsersController < ApplicationController
    skip_before_action :authenticate

    def create
        user = User.new(user_params)

        if user.valid?
            user.save
            token = encode_token(user.id)
            render json: { jwt: token }
        else
            render json: { error: 'user not created, input correct values' }
        end 
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
