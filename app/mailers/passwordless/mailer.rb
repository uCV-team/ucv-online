# frozen_string_literal: true

module Passwordless
  # The mailer responsible for sending Passwordless' mails.
  class Mailer < Passwordless.parent_mailer.constantize
    # Sends a magic link (secret token) email.
    # @param session [Session] A Passwordless Session
    def magic_link(session)
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
      @email = recipient.email
      @magic_link = send(Passwordless.mounted_as)
                    .token_sign_in_url(token)
      mail(
        to: recipient.email,
        from: ENV['MAIL_FROM'],
        subject: I18n.t('devise.mailer.confirmation_instructions.subject')
      )
    end
  end
end
