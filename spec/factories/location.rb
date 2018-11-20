FactoryBot.define do
  factory :location do
    user
    address { 'Wallisellen, 8304 Zurich, Switzerland' }
    latitude { 47 }
    longitude { 8 }
    radius { 10 }
    title { 'Home' }
  end
end
