class Api::V1::LikesController < ApplicationController

    def index 
        @likes = Like.all 
        render json: LikeSerializer.new(@likes)
    end

    def create
        @like = Like.new(post_id: params[:post_id])
        if @like.save
            render json:{ 
                like: LikeSerializer.new(@like)
            }
        else
            render json: {
                status: 500,
                errors: @like.errors.full_messages
            }
        end
    end
end
