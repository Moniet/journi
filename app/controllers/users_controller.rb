class UsersController < ApplicationController
    skip_before_action :authenticate

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            token = encode_token(user.id)
            posts = user.posts.count > 0 ? PostSerializer.new(user.posts) : []
            render json: { jwt: token, posts: posts }, status: :created
        else
            render json: { error: 'user not created, input correct values' }, status: :not_acceptable
        end 
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
