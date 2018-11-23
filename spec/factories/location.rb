FactoryBot.define do
  factory :location do
    user
    city { 'Wallisellen' }
    country { 'Switzerland' }
    original_address { 'Industriestrasse 44, Wallisellen' }
    radius { 10 }
  end
end
