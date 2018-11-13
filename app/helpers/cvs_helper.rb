module CvsHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def study_period(started_on, ended_on)
    started = started_on.present?
    ended = ended_on.present?

    if started && ended
      "#{started_on.year} - #{ended_on.year}" if started && ended
    elsif started
      t('content.main.cv.show.education.on_going', started_on: started_on.year)
    else
      ''
    end
  end
end
