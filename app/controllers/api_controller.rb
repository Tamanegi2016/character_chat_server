class ApiController < ApplicationController
  protect_from_forgery :except => [:become_friend, :talk, :profile_upload]

  def friends
    resp = []
    friend_list = NoSessionUser.find(params[:user_id]).friends
    for friend in friend_list
      hash = {}
      hash['id'] = friend.id
      hash['name'] = friend.name
      hash['profile_url'] = friend.profile_url
      queries1 = "to_user_id = '#{params[:user_id].to_i}' AND from_user_id = '#{friend.id}'"
      queries2 = "from_user_id = '#{params[:user_id].to_i}' AND to_user_id = '#{friend.id}'"
      q1list = Friend.where(queries1)
      q2list = Friend.where(queries2)
      if q1list.empty?
        hash['friend_id'] = q2list[0].id
      else
        hash['friend_id'] = q1list[0].id
      end
      message = NoSessionTalk.where(friend_id: hash['friend_id']).last
      if message.nil?
        hash['message'] = ''
      else
        hash['message'] = message.message
      end
      resp.push(hash)
    end
    resp.uniq!
    render json: resp
  end

  def become_friend
    queries1 = "to_user_id = '#{params[:user_id].to_i}' AND from_user_id = '#{params[:friend_id].to_i}'"
    queries2 = "from_user_id = '#{params[:user_id].to_i}' AND to_user_id = '#{params[:friend_id].to_i}'"
    friend = []
    if Friend.where(queries1).empty? and Friend.where(queries2).empty?
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
    user.save
    render json: {profile_url: user.profile_url.url}
  end

  def regist
    queries = "name = '#{params[:name]}'"
    new_user = []
    if NoSessionUser.where(queries).empty?
      new_user = NoSessionUser.new(name: params[:name])
      new_user.save
    end
    render json: new_user
  end

  def get_users_from_name
    render json: NoSessionUser.where(name: params[:user_name])
  end
  
  def get_users
    if params[:query]
      render json: NoSessionUser.where("name like '" + params[:query] + "%'")
    else 
      render json: NoSessionUser.all()
    end
  end
end
