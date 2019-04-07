module CvsHelper
  def study_period(started_on, ended_on)
    get_period(started_on&.year, ended_on&.year)
  end

  def work_period(started_on, ended_on)
    get_period(started_on&.strftime('%B %Y'), ended_on&.strftime('%B %Y'))
  end

  def birth_info_for(cv)
    return nil unless cv.birth_date.present? || cv.birth_date.present?

    s = []
    s << (cv.gender_female? ? 'Nata' : 'Nato')
    s << "a #{cv.birth_place}" if cv.birth_place.present?
    s << "il #{I18n.l(@cv.birth_date, format: :long)}" if cv.birth_date.present?
    s.join(' ') + '.'
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
