class Api::V1::SessionsController < Api::V1::ApplicationController
    # skip_before_action :authorized_user, only: [:login]
    
    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: 200
        else
            render json: {error: "Invalid Credentials!"}, status: 401
        end
    end

    def logout
        session.delete :user_id
        head :no_content
    end
end
