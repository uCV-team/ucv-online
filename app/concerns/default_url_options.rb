module DefaultUrlOptions
  def default_url_options
    {
      host: host(@current_locale),
      port: port
    }
  end

  private

  def host(locale)
    "http://#{locale}.#{ENV['SERVER_HOST']}"
  end

  def port
    ENV['SERVER_PORT']
  end
end
