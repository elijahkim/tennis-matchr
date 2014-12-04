class Match < ActiveRecord::Base
  belongs_to :challenger, class_name: "User"
  belongs_to :defender, class_name: "User"
end
