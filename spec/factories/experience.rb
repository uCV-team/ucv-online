FactoryBot.define do
  factory :experience do
    company { 'Renuo AG' }
    description { 'Innovative software solutions' }
    ended_on { Date.new(2011) }
    location { 'Zurich, Switzerland' }
    started_on { Date.new(2007) }
    title { 'Web Developer' }
  end
end
