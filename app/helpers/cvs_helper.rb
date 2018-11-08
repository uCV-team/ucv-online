module CvsHelper
  def full_name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def study_period(started_on, ended_on)
    "#{started_on.year} - #{ended_on.year}" if started_on.present? && ended_on.present?
  end
end
