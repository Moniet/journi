class PostsController < ApplicationController
    def create
        if current_user
            post = current_user.posts.build(post_params)
            if post.valid?
                post.save
                render json: post, status: :created
            else
                render json: { errors: 'something went wrong' }, status: :not_acceptable
            end
        else
            render json: { errors: 'unauthorized' }, status: :unauthorized
        end
    end

    def update
        posts =  current_user.posts
        if post
            posts.find {|post| post.id === params[:id]}
            render json: {errors: 'successfully updated'}, status: :ok
        else
            render json: { errors: 'operation failed' }, status: :unauthorized
        end
    end

    def destroy
    end

    private 

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
