namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(username: "Example",
			email: "example@example.com",
			first_name: "Example",
			last_name: "Guy",
			password: "foobar",
			password_confirmation: "foobar", 
			admin: true)
		User.create!(username: "Sample",
			email: "sample@example.com",
			first_name: "Sample",
			last_name: "Guy",
			password: "foobar",
			password_confirmation: "foobar", 
			admin: true)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@example.org"
			password = "password"
			User.create!(username: name,
				email: email,
				password: password,
				password_confirmation: password)
		end

		users = User.all(limit: 6)
		50.times do
			content_one = Faker::Lorem.sentence(7)
			content_two = Faker::Lorem.sentence(7)
			content_three = Faker::Lorem.sentence(7)
			content_four = Faker::Lorem.sentence(7)
			content_five = Faker::Lorem.sentence(7)
			content_six = Faker::Lorem.sentence(7)
			users.each do |user| 
				user.quick_questions.create!(content: content_one)
				user.interest_questions.create!(content: content_two)
				user.thoughtful_questions.create!(content: content_three)
				user.quick_answers.create!(content: content_four)
				user.interest_answers.create!(content: content_five)
				user.thoughtful_answers.create!(content: content_six)
			end 
		end
	end
end