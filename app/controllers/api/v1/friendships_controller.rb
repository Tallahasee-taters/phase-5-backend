class Api::V1::FriendshipsController < Api::V1::ApplicationController

    def create
        Friendship.create!(friendship_params)
        render json: @user, status: 201
    end

    def destroy
        byebug
        f = Friendship.new(params[:id])
        if firend.reciever == @current_user || friend.sender == @current_user
            friend.update(status: "rejected")
        end
        render json: friend, status: 202
    end

    def friendship_params
        params.permit(:reciever_id, :sender_id, :status)
     end
end
