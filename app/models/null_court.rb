class NullCourt
  def name
    nil
  end

  def latitude
    40.74
  end

  def longitude
    -73.97
  end

  def to_json
    {
      latitude: latitude,
      longitude: longitude,
    }.to_json
  end
end
