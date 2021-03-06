# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create!(name: "Stephen Bailey", email: "sbailey@spotlink.com", password: "password", password_confirmation: "password", admin: true, activated: true, activated_at: Time.zone.now)
User.create!(name: "Example User", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar", activated: true, activated_at: Time.zone.now)

99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name: name, email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
users.each do |user|
	50.times do
		content = Faker::Lorem.sentence(5)
		user.microposts.create!(content: content, created_at: rand(0..14400).minutes.ago)
	end
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
