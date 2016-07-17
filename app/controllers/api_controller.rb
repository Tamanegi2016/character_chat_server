class ApiController < ApplicationController

  def friends
    render :json => NoSessionUser.find(params[:user_id]).friends
  end

  def become_friend
    friend = Friend.new(to_user_id: params[:user_id],from_user_id: params[:friend_id])
    friend.save()
  end

  def chat
    chat_id = 1
    render :json => Chat.find(chat_id).no_session_talks
  end
end
