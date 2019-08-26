class PostsController < ApplicationController
    def create
        if current_user
            post = current_user.posts.build(post_params)

            if post.valid?
                post.save
                render json: PostSerializer.new(post), status: :created
            else
                render json: { errors: 'something went wrong' }, status: :not_acceptable
            end
        else
            render json: { errors: 'unauthorized' }, status: :unauthorized
        end
    end

    def update
        posts =  current_user.posts
        post = posts.find(params[:id])
        if post
            post.update_attributes(post_params)
            render json: { success: 'successfully updated'}, status: :ok
        else
            render json: { errors: 'operation failed' }, status: :unauthorized
        end
    end

    def destroy
        posts =  current_user.posts
        post = posts.find(params[:id])
        if post
            post.destroy
            render json: { success: 'successfully updated'}, status: :ok
        else
            render json: { errors: 'operation failed' }, status: :unauthorized
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
