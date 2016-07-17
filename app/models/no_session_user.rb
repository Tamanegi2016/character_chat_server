class NoSessionUser < ApplicationRecord
  # has_many :no_session_users , through: :friend
  has_many :no_session_talks,
           dependent: :destroy
  has_many :friend_of_from_user,
           class_name: 'Friend',
           foreign_key: 'from_user_id',
           dependent: :destroy
  has_many :friend_of_to_user,
           class_name: 'Friend',
           foreign_key: 'to_user_id',
           dependent: :destroy
  has_many :friends_of_from_user,
           through: :friend_of_from_user,
           source: 'to_user'
  has_many :friends_of_to_user,
           through: :friend_of_to_user,
           source: 'from_user'

  def friends
    friends_of_from_user + friends_of_to_user
  end
end
