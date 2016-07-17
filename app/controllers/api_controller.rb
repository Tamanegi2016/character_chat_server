class ApiController < ApplicationController
  protect_from_forgery :except => [:become_friend, :talk]

  def friends
    render json: NoSessionUser.find(params[:user_id]).friends
  end

  def become_friend
    queries = "to_user_id = '#{params[:user_id].to_i}' AND from_user_id = '#{params[:friend_id].to_i}'"
    friend = []
    if Friend.where(queries).empty?
      friend = Friend.new(to_user_id: params[:user_id],from_user_id: params[:friend_id])
      friend.save
    end
    render json: friend
  end

  def talk
    talk = []
    if Friend.exists?(id: params[:friend_id])
      talk = NoSessionTalk.new(
        users_id: params[:user_id],
        friends_id: params[:user_id],
        message: params[:message]
      )
      talk.save
    end
    render json: talk
  end

  def chat
    chat_id = 1
    render json: Chat.find(chat_id).no_session_talks
  end
end
