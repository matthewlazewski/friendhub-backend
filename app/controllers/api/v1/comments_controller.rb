class Api::V1::CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: CommentSerializer.new(comments)
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json:{ 
                comment: CommentSerializer.new(comment)
            }
        else
            render json: {
                status: 500,
                errors: comment.errors.full_messages
            }
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            render json: {}
        else
            render json: @comment.errors
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
