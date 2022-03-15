class UserMailer < ApplicationMailer
  def newsletter(resource_id, recipient_id)
    @newsletter = Newsletter.find_by(id: resource_id)
    @user = User.find_by(id: recipient_id)
    @current_locale = @user.locale
    mail(to: @user.email,
         from: ENV['MAIL_FROM'],
         subject: @newsletter.subject,
         tag: "newsletter_#{resource_id}")
  end

  def email_rebranding(user)
    session = build_passwordless_session(user)
    session.save!
    @current_locale = user.locale
    @user_name = "#{user.first_name} #{user.last_name}"
    @magic_link = send(Passwordless.mounted_as)
                  .token_sign_in_url(session.token, subdomain: @current_locale)
    attachments.inline['new_logo.svg'] = File.read(Rails.root.join(*%w[app javascript images new_logo.svg]))
    mail(
      to: user.email,
      subject: 'Azione richiesta sul tuo CV digitale.'
    )
  end

  private

  def build_passwordless_session(authenticatable)
    Passwordless::Session.new.tap do |us|
      us.user_agent = ' Command Line',
                      us.remote_addr = 'unknown',
                      us.authenticatable = authenticatable
    end
  end
end
