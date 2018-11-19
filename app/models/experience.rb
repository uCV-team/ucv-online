class Experience < ApplicationRecord
  belongs_to :cv
  scope :chronological_order, -> { order(created_at: :desc) }

  validates :company, :title, presence: true
end
