module LocationsHelper
  def api_token
    ENV['LOCATIONIQ_PUBLIC_KEY']
  end

  def location_display(res)
    a = ['city', 'region', 'country']
    cc = []
    a.each do |key|
      cc << res.send(key.to_sym) if res.send(key.to_sym)
    end
    cc.join(', ')
  end
end
