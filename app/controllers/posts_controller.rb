class PostsController < ApplicationController
    def create
        if current_user
            post = current_user.posts.build(post_params)
            if post.valid?
                post.save
                render json: post 
            end
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
