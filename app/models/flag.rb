class Flag < ApplicationRecord
  FLAG_SCORE = 10
  belongs_to :cv
  belongs_to :user

  validates :reason, presence: true, length: { maximum: 40 }

  after_save :unpublish_cv

  # Unpublish User's CV if the flag count is more than 10
  def unpublish_cv
    cv.update(published: false) if cv.flags.count > FLAG_SCORE
  end
end
