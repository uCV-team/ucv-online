FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Williams' }
    sequence(:email) { |i| "john.williams#{i}@example.com" }
    password { 'Password123' }
    password_confirmation { 'Password123' }
  end
end
