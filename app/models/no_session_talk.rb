class NoSessionTalk < ApplicationRecord
  belongs_to :friend
  belongs_to :no_session_user
end
