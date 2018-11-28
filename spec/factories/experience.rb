FactoryBot.define do
  factory :experience do
    cv { build :cv }
    company { 'Renuo AG' }
    description { '' }
    ended_on { Date.new(2011) }
    location { 'Zurich, Switzerland' }
    started_on { Date.new(2007) }
    title { 'Web Developer' }
  end
end
