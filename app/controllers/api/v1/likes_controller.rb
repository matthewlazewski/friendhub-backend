class Api::V1::LikesController < ApplicationController

    def index 
        @likes = Like.all 
        render json: LikeSerializer.new(@likes)
    end

    def create
        @like = current_user.likes.new(post_id: params[:post_id])
        if @like.save
            render json:{ 
                like: LikeSerializer.new(@like)
            }
        else
            render json: {
                status: 500,
                errors: comment.errors.full_messages
            }
        end
    end
end
