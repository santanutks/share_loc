10.times do |i|
  User.create(email: Faker::Internet.email, username: "username#{i}", password: '12345678', password_confirmation: '12345678')
end

User.all.each do |user|
  User.where.not(id: user.id).each_with_index do |friend, i|
    next if i%2 == 0
    user.friendships.create(friend_id: friend.id)
  end
end

locations = [
             { street: 'JA-1 Sector III, Salt Lake City', city: 'Kolkata', state: 'West Bengal', country: 'India'},
             { street: 'Janjikar Street, Near Crawford Market', city: 'Mumbai', state: 'Maharastra', country: 'India'},
             { street: 'Netaji Subhash Marg, Chandni Chowk', city: 'Delhi', state: 'Delhi', country: 'India' }
            ]

user = User.first
locations.each do |loc|
  user.locations.create(loc)
end


p "Log in using #{user.email}/12345678"
