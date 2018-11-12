class Cv < ApplicationRecord
  belongs_to :user
  has_many :educations, dependent: :destroy
  accepts_nested_attributes_for :user

  ABOUT_MAX_LENGTH = 120
  validates :about, length: { maximum: ABOUT_MAX_LENGTH }
  validates :user, uniqueness: true
end
