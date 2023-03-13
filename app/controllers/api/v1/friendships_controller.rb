class Api::V1::FriendshipsController < Api::V1::ApplicationController

    def create
        Friendship.find_or_create_by!(friendship_params)
        render json: @user, status: 201
    end

    def remove
       fr = Friendship.where(sender: @user, reciever_id: params[:friendId]).or(Friendship.where(reciever: @user, sender_id: params[:friendId]))
       fr.destroy_all
       render json: @user, status: 202
    end

    def update
      findFriend = Friendship.find(params[:id])
      findFriend.update!(status: "accepted")
      render json: @user, status: 202
    end

    def destroy
        f = Friendship.find(params[:id])
        # if f.reciever == @current_user || f.sender == @current_user
            f.destroy
        # end
        render json: @user, status: 202
    end

    def friendship_params
        params.permit(:reciever_id, :sender_id)
    end

end
