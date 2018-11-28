FactoryBot.define do
  factory :education do
    cv { build :cv }
    started_on { Date.new(2008) }
    degree { 'Bachelor of Science' }
    description { '' }
    ended_on { Date.new(2012) }
    school { 'ETH' }
  end
end
