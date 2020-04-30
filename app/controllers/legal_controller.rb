class LegalController < ApplicationController
  def terms
    render "legal/terms_#{I18n.locale}"
  end

  def privacy
    render "legal/privacy_#{I18n.locale}"
  end

  def cookie
    render "legal/cookie_#{I18n.locale}"
  end
end
