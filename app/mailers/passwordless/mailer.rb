# frozen_string_literal: true

module Passwordless
  # The mailer responsible for sending Passwordless' mails.
  class Mailer < Passwordless.parent_mailer.constantize
    include DefaultUrlOptions
    # Sends a magic link (secret token) email.
    # @param session [Session] A Passwordless Session
    def magic_link(session)
      @current_locale = session.authenticatable.locale
      I18n.locale = @current_locale
      @session = session

      @magic_link = send(Passwordless.mounted_as)
                    .token_sign_in_url(session.token)

      email_field = @session.authenticatable.class.passwordless_email_field
      mail(
        to: @session.authenticatable.send(email_field),
        from: ENV['MAIL_FROM'],
        subject: I18n.t('passwordless.mailer.subject')
      )
    end

    def user_confirmation_instructions(recipient, token)
      @current_locale = recipient.locale
      I18n.locale = @current_locale
      @email = recipient.unconfirmed_email.presence || recipient.email
      @magic_link = send(Passwordless.mounted_as)
                    .token_sign_in_url(token)
      @user = recipient
      mail(
        to: @email,
        from: ENV['MAIL_FROM'],
        subject: I18n.t('devise.mailer.confirmation_instructions.subject')
      )
    end
  end
end
