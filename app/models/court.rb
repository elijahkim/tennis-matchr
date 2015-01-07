class Court < ActiveRecord::Base
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  geocoded_by :address

  has_many :users

  searchable do
    text :name
    text :address
  end

  def calculate_distance(court_one, court_two)
    court_one.distance_to(court_two.latitude, court_two.longitude).round(2)
  end

  def calculate_distance(court)
    distance_to(court.latitude, court.longitude)
  end

  def calculate_average_elo
    if users.count == 0
      "No Local Users"
    else
      total_elo = 0
      users.each do |user|
        total_elo = total_elo + user.elo
      end
      total_elo / users.count
    end
  end
end
