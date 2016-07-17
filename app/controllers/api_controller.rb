class ApiController < ApplicationController
  protect_from_forgery :except => [:become_friend]
  def friends
    render :json => NoSessionUser.find(params[:user_id]).friends
  end

  def become_friend
    queries = "to_user_id = '#{params[:user_id]}.to_i' AND from_user_id = '#{params[:friend_id]}.to_i'"
    friend = []
    if !Friend.where(queries).empty?
      friend = Friend.new(to_user_id: params[:user_id],from_user_id: params[:friend_id])
      friend.save()
    end
    render :json => friend
  end

  def chat
    chat_id = 1
    render :json => Chat.find(chat_id).no_session_talks
  end
end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
