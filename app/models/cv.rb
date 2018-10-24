class Cv < ApplicationRecord
  belongs_to :user
  has_many :educations, dependent: :destroy
end
