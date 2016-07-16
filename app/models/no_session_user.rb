class NoSessionUser < ApplicationRecord
  has_many :no_session_talks
  has_many :no_session_users , through: :friends
end
