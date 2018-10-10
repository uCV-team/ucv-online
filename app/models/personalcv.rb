class Personalcv < ApplicationRecord
  validates :about, :birth_date, :future_plans, :phone_number, :profile_picture_url, :skills_and_interests,
            :working_skills, presence: true
end
