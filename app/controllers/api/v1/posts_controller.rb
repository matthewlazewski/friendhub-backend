class Api::V1::PostsController < ApplicationController

    def index 
        posts = Post.all
        render json: PostSerializer.new(posts)
    end

    def create
        post = Post.new(post_params)
    
        if post.save
          render json: {
            status: :created,
            post: PostSerializer.new(post)
          }
        else 
          render json: {
            status: 500,
            errors: post.errors.full_messages
          }
        end
    end

    def show
        @post = Post.find(params[:id])
        if @post
            render :show
        else
            render json: ["post not found"], status: 404
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render :show
        else
            render json: @post.errors.full_messages, status: 422
        end
    end

    def destroy
        post = Post.find(params[:id])

        if post.destroy
            render json: {message: "Deleted Post"}
        else
            render json: {error: 'Could not be destroyed'}
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:body, :user_id)
    end
end
