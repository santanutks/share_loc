class Location < ActiveRecord::Base
  attr_accessor :friend_ids

  belongs_to :user
  has_many :shared_locations, dependent: :delete_all

  validates :user, :street, :city, :state, :country, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  def self.long_lat_json
    all.map(&:long_lat_json)
  end

  def long_lat_json
    { address: full_street_address, coordinate: [longitude, latitude] }
  end

  def friend_ids=(arg)
    User.where(id: arg).each do |friend|
      self.shared_locations.build(user: user, friend: friend)
    end
  end

  private
  def full_street_address
    [street, city, state, country].join(',')
  end
end
