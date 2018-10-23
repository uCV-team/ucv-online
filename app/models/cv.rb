class Cv < ApplicationRecord
  belongs_to :user

  validates :about, :birth_date, :future_plans, :phone_number, :photo, :skills_and_interests,
            :working_skills, presence: true
end
