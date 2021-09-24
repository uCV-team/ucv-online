class Message < ApplicationRecord
  belongs_to :user
  validates :name, :email, :content, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_create :check_for_spam
  after_commit :send_notification, on: :create

  def status_open
    update_column(:status, 'open')
  end

  private

  def send_notification
    MessageMailer.send_notification_to_candidate(user_id, id).deliver_later if status == 'new'
  end

  def check_for_spam
    spam_keywords = ENV['SPAM_KEYWORDS'].split(',')
    self.status = 'spam' if spam_keywords.any? { |spam_keyword| content.include?(spam_keyword) }
  end
end
