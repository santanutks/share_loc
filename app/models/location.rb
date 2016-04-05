class Location < ActiveRecord::Base
  belongs_to :user

  validates :user, :street, :city, :state, :country, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  private
  def full_street_address
    [street, city, state, country].join(',')
  end
end
