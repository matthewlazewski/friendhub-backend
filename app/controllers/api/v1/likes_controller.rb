class Api::V1::LikesController < ApplicationController
    before_action :find_post

    def index 
        likes = Post.find(params[:post_id])
        render json: likes 
    end

    def create
        @post.likes.create(user_id: current_user.id)
        render json: like 
    end

    def destroy 
        like = Like.find(params[:id])

        if like.destroy 
            render json: like 
        else 
            render json: like.errors, status: 404
        end
    end

    private 

    def find_post
        @post = Post.find(params[:post_id])
    end
end
