class DateRangeValidator < ActiveModel::Validator
  def validate(record)
    if date_range_exists?(record) && date_range_valid?(record)
      record.errors[:base] << "Please pick a valid date range"
    end

    if date_range_exists?(record) &&  date_range_less_than?(record, 30)
      record.errors[:base] << "Please pick a date range less than 30 days"
    end
  end

  private

  def date_range_in_days(record)
    record.end_date - record.start_date
  end

  def date_range_exists?(record)
    record.start_date && record.end_date
  end

  def date_range_valid?(record)
    record.start_date > record.end_date
  end

  def date_range_less_than?(record, days)
    date_range_in_days(record) >= days
  end
end
