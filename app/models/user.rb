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

  def requested(user)
    opponents.include?(user)
  end
end
