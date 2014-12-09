class DateRangeValidator < ActiveModel::Validator
  def validate(record)
    if record.start_date >= record.end_date
      record.errors[:base] << "Please pick a valid date range"
    end
  end
end
