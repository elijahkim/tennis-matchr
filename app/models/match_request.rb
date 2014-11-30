class MatchRequest < ActiveRecord::Base
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :request_message, presence: true
  validates :opponent, uniqueness: {
    scope: :requester,
    message: "should be unique"
  }

  belongs_to :requester, class_name: "User"
  belongs_to :opponent, class_name: "User"
  has_many :comments

  delegate :username, to: :requester, prefix: true
  delegate :username, to: :opponent, prefix: true

  def self.pending
    where(confirmed: false)
  end

  def get_comments
    comments.order(created_at: :desc)
  end
end
