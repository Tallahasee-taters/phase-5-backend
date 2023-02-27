class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :create, :update, :destroy]
    def index
        render json: Comments.all, status: :ok
    end

    def show
        render json: @show, status: :ok
    end

    def create 
        render json: Comment.create!(comment_params), status: :created
    end

    def update
        render json: @comment.update!(comment_params), status: 200
    end

    def destroy
        @comment.destroy
        head :no_content
    end

    private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.permit(:text, :upvote, :downvote, :user_id)
    end
end
