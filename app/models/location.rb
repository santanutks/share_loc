class Location < ActiveRecord::Base
  belongs_to :user

  validates :user, :street, :city, :state, :country, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  def self.long_lat_json
    all.map(&:long_lat_json)
  end

  def long_lat_json
    { address: full_street_address, coordinate: [longitude, latitude] }
  end

  private
  def full_street_address
    [street, city, state, country].join(',')
  end
end
