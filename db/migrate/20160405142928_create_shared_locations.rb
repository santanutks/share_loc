class CreateSharedLocations < ActiveRecord::Migration
  def change
    create_table :shared_locations do |t|
      t.belongs_to :user,      null: false
      t.belongs_to :location,  null: false
      t.integer    :friend_id, null: false
      t.timestamps null: false
    end
    add_foreign_key :shared_locations, :users
    add_foreign_key :shared_locations, :locations
    add_foreign_key :shared_locations, :users, column: :friend_id

    add_index :shared_locations, [:user_id, :location_id, :friend_id], unique: true
  end
end
