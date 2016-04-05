10.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: '12345678', password_confirmation: '12345678')
end

User.all.each do |user|
  User.where.not(id: user.id).each do |friend|
    user.friendships.create(friend_id: friend.id)
  end
end
