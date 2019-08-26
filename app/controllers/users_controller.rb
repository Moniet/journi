class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create]

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            token = encode_token(user.id)
            render json: { jwt: token }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :not_acceptable
        end 
    end

    def user_posts
        if current_user
            posts = current_user.posts.count > 0 ? PostSerializer.new(current_user.posts) : []
            render json: { posts: posts }, status: :ok
        else
            render json: { errors: 'unauthorized' }, status: :unauthorized
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
