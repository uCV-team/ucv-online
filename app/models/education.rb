class Education < ApplicationRecord
  belongs_to :cv

  validates :school, presence: true
end
