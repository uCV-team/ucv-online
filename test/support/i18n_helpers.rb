module I18nHelpers
  def t(locale, options = {})
    I18n.t(locale, options)
  end

  # sanitized html
  def sh(html)
    Rails::Html::FullSanitizer.new.sanitize(html)
  end

  # sanitized html translation: sanitizes html locales
  def st(html_locale, options = {})
    sh(t(html_locale, options))
  end
end
