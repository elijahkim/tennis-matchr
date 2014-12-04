class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :comments
  has_many :incoming_match_requests,
    class_name: "MatchRequest",
    foreign_key: "opponent_id"
  has_many :opponents, through: :outgoing_match_requests
  has_many :outgoing_match_requests,
    class_name: "MatchRequest",
    foreign_key: "requester_id"
  has_many :requesters, through: :incoming_match_requests

  delegate :pending, to: :incoming_match_requests, prefix: true
  delegate :pending, to: :outgoing_match_requests, prefix: true

  def requested?(user)
    !!requested_match(user)
  end

  def requested_match(user)
    outgoing_match_requests_pending.find_by(opponent: user)
  end
end
