class MatchRequest < ActiveRecord::Base
  include ActiveModel::Validations

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :request_message, presence: true
  validates :opponent, uniqueness: {
    conditions: -> { where(confirmed: false) },
    scope: :requester,
    message: "should be unique"
  }

  validates_with DateRangeValidator
  validates_with DateRangeLengthValidator
  validates_with MatchDateInDateRangeValidator

  belongs_to :requester, class_name: "User"
  belongs_to :opponent, class_name: "User"

  has_many :comments

  delegate :username, to: :requester, prefix: true
  delegate :username, to: :opponent, prefix: true

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
