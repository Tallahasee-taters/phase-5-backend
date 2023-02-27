class VideoPostsController < ApplicationController
    def index
        render json: VideoPost.all, status: :ok
    end

    def show
        render json: @video_post, status: :ok
    end

    def create 
       render json: VideoPost.create!(video_post_params), status: :created
    end

    def update
        render json: @video_post.update!(video_post_params), status: 200
    end

    def destroy
        @video_post.destroy
        head :no_content
    end

    private 

    def find_video_post
        @video_post = VideoPost.find(params[:id])
    end

    def video_post_params
        params.permit(:header, :user_id, :video_id, :comment_id) 
    end
end
