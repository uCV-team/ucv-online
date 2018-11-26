class Experience < ApplicationRecord
  belongs_to :cv

  validates :company, :title, presence: true

  scope :chronological_order, -> { order(created_at: :desc) }
end
