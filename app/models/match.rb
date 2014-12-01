class Match < ActiveRecord::Base
  belongs_to :challenger, class_name: "User"
  belongs_to :opponent, class_name: "User"
end
