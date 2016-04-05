class SharedLocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  belongs_to :friend, class_name: User

  validates :user, :location, :friend, presence: true
  validates_uniqueness_of :location_id, scope: [:user_id, :friend_id]
end
