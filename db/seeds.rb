# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'Johnny',
             last_name: 'Williams',
             email: 'johnny@renuo.ch',
             password: 'Password123',
             cv_attributes: {
               gender: 'm',
               about: 'Sono un programmatore con 7 anni di esperienza, laureato in ingegneria biomedica e con un background nel marketing. Cerco occupazione in una Startup con compenso parzialmente in equity. Parlo italiano, inglese e francese. Lavoro bene a distanza da remoto.',
               birth_date: Date.new(1995, 3, 21),
               birth_place: 'Milano',
               interests: 'IT, Cooking, Reading',
               future_plans: 'Start my own business in IT',
               skills: 'Cooking, Climbing, Skiing',
               working_skills: 'Web Developer, Project Manager'
             })
