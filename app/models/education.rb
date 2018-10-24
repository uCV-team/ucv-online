class Education < ApplicationRecord
  belongs_to :cv

  validates :degree, :school, presence: true
end
