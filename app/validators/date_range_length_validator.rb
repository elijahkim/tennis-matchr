class DateRangeLengthValidator < ActiveModel::Validator
  def validate(record)
    if date_range_in_days(record) >= 30
      record.errors[:base] << "Please pick a date range less than 30 days"
    end
  end
end

private

def date_range_in_days(record)
  record.end_date - record.start_date
end
