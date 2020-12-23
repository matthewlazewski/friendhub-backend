class Api::V1::LikesController < ApplicationController
    before_action :find_post

    def index 
        likes = Post.find(params[:post_id])
        render json: likes 
    end

    def create
        if already_liked?
            flash[:notice] = "You already liked this"
        else 
            @post.likes.create(user_id: current_user.id)
        end 
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

    def already_liked?
        Like.where(user_id: current_user.id, post_id)
        params[:post_id].exists?
    end
end
