class Api::V1::LikesController < ApplicationController
    # before_action :find_post

    def index 
        likes = Like.all
        render json: LikeSerializer.new(likes)
    end

    def create
        if like.save
            render json:{ 
                like: LikeSerializer.new(like)
            }
        else
            render json: {
                status: 500,
                errors: comment.errors.full_messages
            }
        end
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
        Like.where(user_id: current_user.id, post: post_id)
        params[:post_id].exists?
    end
end
