class ApiController < ApplicationController
  protect_from_forgery :except => [:become_friend, :talk, :profile_upload]

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
        no_session_user_id: params[:user_id],
        friend_id: params[:user_id],
        message: params[:message]
      )
      talk.save
    end
    render json: talk
  end

  def chat
    chat = NoSessionTalk.where(friend_id: params[:friend_id]).eager_load(:no_session_user)
    resp = []
    for message in chat
      hash = {}
      hash["name"] = message.no_session_user.name
      hash["url"] = message.no_session_user.profile_url
      hash["message"] = message.message
      hash["createde_at"] = message.created_at
      resp.push(hash)
    end
    render json: chat
  end

  def profile_upload
    user = NoSessionUser.find(params[:user_id])
    user.profile_url = params[:profile]
    render json: {profile_url: user.profile_url.url}
  end
end
