class Api::V1::VideosController < Api::V1::ApplicationController

    def index
        render json: Video.all, status: 200
    end

    def show
        video = Video.find(params[:id])
        render json: video, status: 200
    end

    def create 
        render json: Video.create!(video_params), status: :created
     end
 
     def update
         render json: @video.update!(video_params), status: 200
     end
 
     def destroy
         @video.destroy
         head :no_content
     end
 
     private 
 
     def find_video
         @video = Video.find(params[:id])
     end
 
     def video_params
         params.permit(:header, :user_id, :video_id, :comment_id) 
     end
end
