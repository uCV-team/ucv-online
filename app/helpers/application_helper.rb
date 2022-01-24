module ApplicationHelper
  def seo_title
    return 'YouCV' unless @seo_title
    return "#{@seo_title} @ YouCV" unless home?

    @seo_title
  end

  def updated_email(user)
    user.unconfirmed_email.presence || user.email
  end

  private

  def home?
    controller_name == 'home' && action_name == 'index'
  end
end
