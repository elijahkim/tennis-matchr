class User < ActiveRecord::Base
  attr_accessor :transformed_rating, :expected_score, :score_value

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :comments

  has_many(
    :incoming_matches,
    class_name: "Match",
    foreign_key: "defender_id"
  )
  has_many(
    :incoming_match_requests,
    class_name: "MatchRequest",
    foreign_key: "opponent_id"
  )
  has_many :opponents, through: :outgoing_match_requests
  has_many(
    :outgoing_matches,
    class_name: "Match",
    foreign_key: "challenger_id"
  )
  has_many(
    :outgoing_match_requests,
    class_name: "MatchRequest",
    foreign_key: "requester_id"
  )
  has_many :requesters, through: :incoming_match_requests
  has_many :activities

  belongs_to :court

  delegate :pending, to: :incoming_match_requests, prefix: true
  delegate :pending, to: :outgoing_match_requests, prefix: true

  paginates_per 12

  searchable do
    text :username, :elo, :first_name, :last_name, :email
  end

  def requested?(user)
    !!requested_match(user)
  end

  def requested_match(user)
    outgoing_match_requests_pending.find_by(opponent: user)
  end

  def matches
    Match.where(
      "challenger_id = :user_id OR defender_id = :user_id",
      user_id: id).
      order(match_at: :desc)
  end
end
