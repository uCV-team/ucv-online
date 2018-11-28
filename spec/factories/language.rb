FactoryBot.define do
  factory :language do
    cv { build :cv }
    language { 'English' }
    level { 'b2' }
  end
end
