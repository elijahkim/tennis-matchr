class MatchRequest < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :opponent, class_name: "User"
  belongs_to :requester, class_name: "User"

  has_many :comments

  validates :opponent, presence: true
  validates :opponent, uniqueness: {
    conditions: -> { where(confirmed: false) },
    scope: :requester,
    message: "should be unique"
  }
  validates :opponent_elo, presence: true
  validates :requester, presence: true
  validates :requester_elo, presence: true
  validates :request_message, presence: true

  validates_with DateRangeValidator
  validates_with MatchDateInDateRangeValidator

  delegate :username, to: :opponent, prefix: true
  delegate :username, to: :requester, prefix: true

  def self.pending
    where(confirmed: false)
  end

  def confirm!
    update(confirmed: true)
  end

  def get_comments
    comments.order(created_at: :desc)
  end

  def player?(user)
    requester == user || opponent == user
  end
end
