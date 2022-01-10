module CvsHelper
  def study_period(started_on, ended_on)
    get_period(started_on&.year, ended_on&.year)
  end

  def work_period(started_on, ended_on)
    get_period(started_on&.strftime('%B %Y'), ended_on&.strftime('%B %Y'))
  end

  def birth_info_for(cv)
    return nil unless cv.birth_day.present? || cv.birth_month.present? || cv.birth_year.present?

    I18n.t('content.main.cv.show.intro.birth_date', day: cv.birth_day, month: cv.birth_month, year: cv.birth_year)
  end

  def short_desc(text, len)
    text.truncate(len,  separator: ' ') if text.present?
  end

  def cv_show_page?
    params[:controller] == 'cvs' && params[:action] == 'show'
  end

  def cv_full_name(cv_obj)
    "#{cv_obj.first_name} #{cv_obj.last_name}"
  end

  def cv_abbr_name(cv_obj)
    "#{cv_obj.first_name} #{cv_obj.last_name[0]}."
  end

  def cv_user_name(cv_obj)
    cv_obj.publish_last_name? ? cv_full_name(cv_obj) : cv_abbr_name(cv_obj)
  end

  def display_name(cv_obj)
    cv_obj.publish_last_name? ? cv_obj.full_name : cv_obj.abbr_name
  end

  def tooltip_icon(title)
    content_tag(:div, class: 'tool-tip text-muted mr-2', data: { toggle: 'tooltip', placement: 'left' },
                      title: t("tooltips.#{title}")) do
      content_tag(:i, '', class: 'info-icon fas fa-info-circle')
    end
  end

  # to show edit controls when Cv owner view it in edit mode
  def edit_mode?
    (can? :update, @cv) && params[:preview] != 't'
  end

  def cv_cache_key(cv)
    if !user_signed_in? || params[:preview].present?
      "cv_section_#{locale}_#{cv.updated_at.to_i}_open"
    else
      "cv_section_#{locale}_#{cv.updated_at.to_i}"
    end
  end

  def cv_image_edit(cv)
    cv.headshot_file_name.present? ? 'icon_size' : 'popup-text'
  end

  private

  def get_period(start_date, end_date)
    if start_date.present? && end_date.present?
      "#{start_date} - #{end_date}"
    elsif start_date.present?
      t('content.main.cv.show.entries.on_going', started_on: start_date)
    else
      ''
    end
  end
end
