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
Cv.create!(user: user,
           about: 'Hi! I\'m Johnny and I love to code!',
           birth_date: Date.new(1995, 3, 21),
           interests: 'IT, Cooking, Reading',
           future_plans: 'Start my own business in IT',
           skills: 'Cooking, Climbing, Skiing',
           working_skills: 'Web Developer, Project Manager')
