require 'faker'

if User.count == 0
  1000.times.each do |user|
    begin
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        subdomain: Faker::Name.first_name,
        confirmed_at: Time.zone.now,
        password: Devise::Encryptor.digest(User, "supersecret")
      )
      cv = user.cv.update(
        about: Faker::Lorem.paragraph,
        published: true,
        published_at: Time.zone.now
      )
      rand(1..3).times do
        user.cv.experiences.create(
          company: Faker::Company.name,
          description: Faker::Lorem.sentences,
          title: Faker::Company.industry
        )
      end

      rand(1..3).times do
        user.cv.educations.create(
          school: Faker::Educator.university,
          degree: Faker::Educator.degree
        )
      end
      location = user.locations.create(
        city: Faker::Address.city,
        original_address: Faker::Address.full_address,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude
      )
      puts "user created: #{user.email}"
    rescue => e
      puts "Error: #{e.message}"
    end
  end
end

user = User.create!(
  first_name: 'Admin',
  last_name: 'YouCV',
  email: 'admin@youCV.co',
  subdomain: 'admin',
  confirmed_at: Time.zone.now,
  password: 'supersecret'
)
role = Role.create!(
  name: 'admin',
)
user.roles << role
