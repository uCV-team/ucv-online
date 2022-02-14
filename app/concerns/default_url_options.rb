module DefaultUrlOptions
  def default_url_options
    {
      host: host,
      port: port
    }
  end

  private

  def host
    # We can set the mail host customly from here.
    # Or we can keep the ucv.online the host even if user logs in from it or en.ucv.online
    # @current_locale.to_s == 'en' ? ENV['EN_SERVER_HOST'] : ENV['IT_SERVER_HOST']
    ENV['EN_SERVER_HOST']
  end

  def port
    ENV['SERVER_PORT']
  end
end
