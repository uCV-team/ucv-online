class Contact < ApplicationRecord
  belongs_to :user
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_create :check_for_spam
  after_commit :send_notification, on: :create

  private

  def send_notification
    ContactMailer.send_notification_to_candidate(user_id, id).deliver_later if status == 'new'
  end

  def check_for_spam
    keys = ENV['SPAM_KEYWORDS'].split(',')
    self.status = 'spam' if keys.any? { |x| message.include?(x) }
  end
end
