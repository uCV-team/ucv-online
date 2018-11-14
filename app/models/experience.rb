class Experience < ApplicationRecord
  belongs_to :cv

  validates :company, :title, presence: true
end
