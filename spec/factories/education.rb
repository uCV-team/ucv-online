FactoryBot.define do
  factory :education do
    cv
    beginning { Date.new(2007) }
    degree { 'Bachelor of Science' }
    description { '' }
    ending { Date.new(2011) }
    school { 'ETH' }
  end
end
