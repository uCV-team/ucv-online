# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(first_name: 'Johnny',
                    last_name: 'Williams',
                    email: 'johnny@renuo.ch',
                    password: 'Password123',
                    password_confirmation: 'Password123')

cv = Cv.find_or_initialize_by(user_id: user.id)
cv.about = 'Hi! I\'m Johnny and I love to code!'
cv.birth_date = Date.new(1995,3,21)
cv.interests = 'IT, Cooking, Reading'
cv.future_plans = 'Start my own business in IT'
cv.skills = 'Cooking, Climbing, Skiing'
cv.working_skills = 'Web Developer, Project Manager'
cv.save!
