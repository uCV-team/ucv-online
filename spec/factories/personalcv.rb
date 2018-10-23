FactoryBot.define do
  factory :personalcv do
    user
    about { 'There is not that much to say about me. I am a friendly person, and I love to code!' }
    birth_date { Date.new(1995, 0o5, 25) }
    future_plans { 'First I would like to finish my studies, then find a good and stable job.' }
    phone_number { '079 123 12 12' }
    profile_picture_url { 'profile_pic.jpg' }
    skills_and_interests do
      'I am a good cooker and I think I can sing pretty well. My interests lie with programming
      and discorvering new things'
    end
    working_skills { 'Programming' }
  end
end
