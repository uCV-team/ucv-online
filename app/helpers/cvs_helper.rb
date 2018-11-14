module CvsHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def study_period(started_on, ended_on)
    start_date = started_on.year if started_on.present?
    end_date = ended_on.year if ended_on.present?

    get_period(start_date, end_date)
  end

  def work_period(started_on, ended_on)
    start_date = "#{started_on.strftime('%B')} #{started_on.year}" if started_on.present?
    end_date = "#{ended_on.strftime('%B')} #{ended_on.year}" if ended_on.present?

    get_period(start_date, end_date)
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
