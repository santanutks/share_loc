class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :locations,   inverse_of: :user, dependent: :destroy
  has_many :friendships, inverse_of: :user, dependent: :delete_all
  has_many :friends, through: :friendships, foreign_key: :friend_id

  has_many :shared_locations

  def accessible_locations
    Location.joins('left join shared_locations on shared_locations.location_id = locations.id').where('locations.user_id = ? OR shared_locations.friend_id = ?', id, id)
  end
end
