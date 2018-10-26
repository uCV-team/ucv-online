FactoryBot.define do
  factory :education do
    cv
    started_on { Date.new(2007) }
    degree { 'Bachelor of Science' }
    description { '' }
    ended_on { Date.new(2011) }
    school { 'ETH' }
  end
end
