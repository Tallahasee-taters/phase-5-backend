class VideosController < ApplicationController
    def index
        render json: Video.all, status: 200
    end

    def show
        video = Video.find(params[:id])
        render json: video, status: 200
    end
end
