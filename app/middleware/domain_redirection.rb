require 'rack/proxy'

class DomainRedirection < Rack::Proxy
  def initialize(app)
    super
    @app = app
  end

  def perform_request(env)
    host_arr = env['HTTP_HOST'].split('.')
    if env['HTTP_HOST'].include?('publicv') && host_arr.length > 2 && !I18n.available_locales.map(&:to_s).include?(host_arr.first)
      env['rack.ssl_verify_none'] = true
      env['HTTP_HOST'] = "#{env['HTTP_HOST'].split('.').first}.#{ENV['SERVER_HOST']}"
      env['HTTP_COOKIE'] = ''
      super(env)
    else
      @app.call(env)
    end
  end

  def rewrite_response(triplet)
    _status, headers, _body = triplet
    headers['content-length'] = nil
    triplet
  end
end
