module AdminHelper
  def format_datetime(datetime)
    return nil unless datetime

    datetime.strftime('%d/%m/%Y %T')
  end
end
