class UserMailer < ApplicationMailer
  def newsletter(resource_id, recipient_id)
    @newsletter = Newsletter.find_by(id: resource_id)
    @user = User.find_by(id: recipient_id)
    @current_locale = @user.locale
    headers['Unsubscribe'] = "<#{unsubscribe_preference_url(Mailkick.generate_token(@user.email, user: @user))}>"
    mail_send(to: @user.email,
              from: ENV['MAIL_FROM'],
              subject: @newsletter.subject,
              tag: "newsletter_#{resource_id}")
  end
end
