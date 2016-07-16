class Friend < ApplicationRecord
  belongs_to :from_user, :class_name => 'NoSessionUser'
  belongs_to :to_user, :class_name => 'NoSessionUser'
end
