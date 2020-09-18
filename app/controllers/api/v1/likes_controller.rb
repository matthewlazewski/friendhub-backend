class API::V1::LikesController < ApplicationController
    def index 
        likes = Post.find(params[:post_id])
        render json: likes 
    end

    def create
        like = current_user.likes.new(post_id: params[:post_id])
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
end
