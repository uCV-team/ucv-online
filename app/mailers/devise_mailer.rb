class DeviseMailer < Devise::Mailer
  include DefaultUrlOptions

  def confirmation_instructions(record, token, opts = {})
    @current_locale = record.locale
    I18n.locale = record.locale
    super
  end

  def reset_password_instructions(record, token, opts = {})
    @current_locale = record.locale
    I18n.locale = record.locale
    super
  end

  def unlock_instructions(record, token, opts = {})
    @current_locale = record.locale
    I18n.locale = record.locale
    super
  end

  def email_changed(record, opts = {})
    @current_locale = record.locale
    I18n.locale = record.locale
    super
  end

  def password_change(record, opts = {})
    @current_locale = record.locale
    I18n.locale = record.locale
    super
  end
end
