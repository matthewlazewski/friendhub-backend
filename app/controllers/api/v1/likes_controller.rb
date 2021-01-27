class Api::V1::LikesController < ApplicationController

    def index 
        @likes = Like.all 
        render json: LikeSerializer.new(@likes)
    end

    def create
        params[:like][:user_id] = current_user.id
        @like = Like.new(like_params)
        if @like.save
            render json: LikeSerializer.new(@like)
        else
            flash[:alert] = @like.errors.full_messages.join(', ')
        end
    end

    protected 
    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
