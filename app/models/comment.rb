class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :match_request

  delegate :username, to: :user 
end
