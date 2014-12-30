class MatchNotRequestedWithSelfValidator < ActiveModel::Validator
  def validate(record)
    if record.opponent == record.requester
      record.errors[:base] << "You cannot request a match with yourself"
    end
  end
end
