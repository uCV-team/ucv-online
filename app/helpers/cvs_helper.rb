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
