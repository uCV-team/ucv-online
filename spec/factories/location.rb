FactoryBot.define do
  factory :location do
    user
    original_address { 'New York, NY' }
    radius { 10 }
  end
end
