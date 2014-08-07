require 'faker'

module UserImporter
	def self.import
		50.times do 
				User.create(handle: Faker::Internet.user_name,
      						  name: Faker::Name.name,
      						  email: Faker::Internet.email,
      						  bio: Faker::Lorem.sentence)
			end
		end

		# def self.relationships
		# 	User.all.each do |user| 
		# 		user.followers << User.find(rand(1..50))
		# 	end
		# end
end

module TweetImporter
		def self.import
			100.times do 
				Tweet.create(user: rand(1..50),
    								 content: Faker::Lorem.sentence)
		end
	end
end

UserImporter.import
# UserImporter.relationships
TweetImporter.import 
