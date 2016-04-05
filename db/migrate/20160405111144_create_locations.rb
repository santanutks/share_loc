class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :user, null: false, index: true
      t.text       :street,  null: false
      t.string     :city,    null: false
      t.string     :state,   null: false
      t.string     :country, null: false
      t.float      :latitude
      t.float      :longitude
      t.timestamps null: false
    end
  end
end
