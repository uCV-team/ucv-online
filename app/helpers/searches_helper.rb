module SearchesHelper
  def searches_preview(key, cv_obj)
    case key.to_s
    when 'about'
      short_desc(cv_obj.about, 85)
    when 'working_skills'
      short_desc(cv_obj.working_skills, 25)
    when 'salary_expectation'
      "#{cv_obj.expected_salary_currency}
          #{number_to_human(cv_obj.expected_salary_cents, format: '%n%u',
                                                          units: { thousand: 'K', million: 'M', billion: 'B' })}"
    when 'notice_period'
      "#{cv_obj.notice_period} days"
    end
  end

  def add_klass(key)
    if key.to_s == 'salary_expectation' || key.to_s == 'notice_period'
      'col-md-6'
    else
      'col-md-12'
    end
  end
end
