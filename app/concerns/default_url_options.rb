module DefaultUrlOptions

  def default_url_options
    {
      host: host,
      port: port
    }
  end

  private

  def host
    @current_locale.to_s == 'en' ? ENV['EN_SERVER_HOST'] : ENV['IT_SERVER_HOST']
  end

  def port
    ENV['SERVER_PORT']
  end
end
