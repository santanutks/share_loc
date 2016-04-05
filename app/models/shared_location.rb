class SharedLocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  belongs_to :friend, class_name: User
end
