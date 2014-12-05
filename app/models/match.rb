class Match < ActiveRecord::Base
  belongs_to :challenger, class_name: "User"
  belongs_to :defender, class_name: "User"
  belongs_to :winner, class_name: "User"

  delegate :username, to: :challenger, prefix: true
  delegate :username, to: :defender, prefix: true
end
