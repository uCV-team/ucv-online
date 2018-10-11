module FlashHelper
  def alert_class_for(flash_type)
    {
      notice: 'alert-info',
      success: 'alert-success',
      alert: 'alert-warning',
      error: 'alert-danger'
    }.fetch(flash_type.to_sym, flash_type.to_s)
  end
end
