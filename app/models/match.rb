class Match < ActiveRecord::Base
  belongs_to :challenger, class_name: "User"
  belongs_to :defender, class_name: "User"
  belongs_to :winner, class_name: "User"

  delegate :username, to: :challenger, prefix: true
  delegate :username, to: :defender, prefix: true
  delegate :username, to: :winner, prefix: true

  validates :challenger, presence: true
  validates :defender, presence: true
  validates :match_at, presence: true

  def winner?
    winner
  end

  def player?(user)
    defender == user || challenger == user
  end
end
