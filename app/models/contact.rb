class Contact < ApplicationRecord
  belongs_to :user
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_commit :send_notification, on: :create

  private

  def send_notification
    ContactMailer.send_notification_to_candidate(user_id, id).deliver_later
  end
end
