10.times do |i|
  User.create(email: Faker::Internet.email, username: "username#{i}", password: '12345678', password_confirmation: '12345678')
end

User.all.each do |user|
  User.where.not(id: user.id).each_with_index do |friend, i|
    next if i%2 == 0
    user.friendships.create(friend_id: friend.id)
  end
end

p "Log in using #{User.first.email}/12345678"
