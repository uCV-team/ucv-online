module CvsHelper
  def study_period(started_on, ended_on)
    get_period(started_on&.year, ended_on&.year)
  end

  def work_period(started_on, ended_on)
    get_period(started_on&.strftime('%B %Y'), ended_on&.strftime('%B %Y'))
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
