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
	end
end