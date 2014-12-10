class MatchDateInDateRangeValidator < ActiveModel::Validator
  def validate(record)
    if record.match_at && !in_date_range?(record)
      record.errors[:match_date].
        append "must be between #{record.start_date} and #{record.end_date}"
    end
  end

  private

  def in_date_range?(record)
    after_start_date?(record) &&  before_end_date?(record)
  end

  def after_start_date?(record)
    record.match_at > record.start_date
  end

  def before_end_date?(record)
    record.match_at < record.end_date
  end
end
