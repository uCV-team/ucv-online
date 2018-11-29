FactoryBot.define do
  factory :cv do
    about { 'There is not that much to say about me. I am a friendly person, and I love to code!' }
    birth_date { Date.new(1995, 0o5, 25) }
    future_plans { 'First I would like to finish my studies, then find a good and stable job.' }
    interests { 'IT, cooking, reading' }
    phone_number { '079 123 12 12' }
    photo { 'profile_pic.jpg' }
    skills { 'Cooking, skiing, climbing' }
    working_skills { 'Programming' }

    trait :complete_cv do
      educations { [build(:education)] }
      experiences { [build(:experience)] }
      languages { [build(:language)] }
    end
  end
end
