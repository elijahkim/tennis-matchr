class Guest
  def name
    "Guest"
  end

  def id
    "0"
  end

  def requested?(_user)
    false
  end

  def court
    NullCourt.new
  end
end
