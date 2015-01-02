class Court < ActiveRecord::Base
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  geocoded_by :address
end
