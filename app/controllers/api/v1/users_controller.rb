class Api::V1::UsersController < Api::V1::ApplicationController
    skip_before_action :authorized_user, only: [:create]

    def index 
        render json: User.all, status: 200
    end

    def show
        render json: @user, status: 200
    end

    def create
        new_user = User.create!(user_params)
        session[:user_id] = new_user.id
        render json: new_user, status: :created
    end

    def update 
        render json: @user.update!(user_params), status: 200
    end

    def destroy
        @user.destroy
        head :no_content
    end

    private 

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:username, :email, :password)
    end
end
