module CvsHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def study_period(started_on, ended_on)
    if started_on.present? && ended_on.present?
      "#{started_on.year} - #{ended_on.year}" if started_on.present? && ended_on.present?
    elsif started_on.present?
      t('content.main.cv.show.education.on_going', started_on: started_on.year)
    else
      ''
    end
  end
end
