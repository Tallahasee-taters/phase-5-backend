class Api::V1::VideosController < Api::V1::ApplicationController
    before_action :find_video, only: [:update, :destroy, :show]
    def index
        render json: Video.all, status: 200
    end

    def show
        render json: @video, status: 200
    end

    def create 
        render json: @user.videos.create!(video_params), status: :created
     end
 
     def update
        if @video.user == @user
            params[:user_id] = @user.id
            @video.update!(video_params)
            render json: @video, status: 202
        else 
            render json: {error: "Not authorized"}, status: :unauthorized
       end
     end
 
     def destroy 
        if @video.user == @user
             @video.destroy
             head :no_content
        else 
             render json: {error: "Not authorized"}, status: :unauthorized
        end
    end
 
     private 
 
     def find_video
         @video = Video.find(params[:id])
     end
 
     def video_params
         params.permit(:title, :user_id, :video_url, :comment_id) 
     end
end
