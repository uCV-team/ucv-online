class Language < ApplicationRecord
  belongs_to :cv

  validates :language, presence: true
end
