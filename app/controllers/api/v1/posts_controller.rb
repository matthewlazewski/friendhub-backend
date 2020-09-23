class Api::V1::PostsController < ApplicationController

    def index 
        posts = Post.all
        render json: PostSerializer.new(posts)
    end

    def create
        post = Post.new(post_params)

        post.save
        render json: PostSerializer.new(post)
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
        @post = Post.find(params[:id])

        if @post.destroy
            render :show
        else
            render json: @post.errors.full_messages, status: 422
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:body, :user_id)
    end
end
