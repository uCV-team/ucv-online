class Cv < ApplicationRecord
  belongs_to :user
  has_many :educations, dependent: :destroy

  ABOUT_MAX_LENGTH = 250
  validates :about, length: { maximum: ABOUT_MAX_LENGTH }
end
