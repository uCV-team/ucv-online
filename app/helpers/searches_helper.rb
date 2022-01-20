module SearchesHelper
  def searches_preview(key, cv_obj, usr)
    case key.to_s
    when 'working_skills'
      short_desc(cv_obj.working_skills, 25)
    when 'languages'
      short_desc(cv_obj.languages.pluck(:language).join(', '), 25)
    when 'salary_expectation'
      "#{cv_obj.expected_salary_currency}
          #{number_to_human(cv_obj.expected_salary_cents, format: '%n%u',
                                                          units: { thousand: 'K', million: 'M', billion: 'B' })}"
    when 'notice_period'
      "#{cv_obj.notice_period} days"
    when 'contract_type'
      append_contract_type(cv_obj)
    when 'locations'
      short_desc(usr.original_address, 25)
    end
  end

  private

  def append_contract_type(cv_obj)
    required_contract_hash = []
    contract_hash = { 'Permanent' => cv_obj.permanent_contract, 'Temporary' => cv_obj.temporary_contract,
                      'Freelance' => cv_obj.freelance, 'Internship' => cv_obj.internship }
    contract_hash.each { |key, value| required_contract_hash << key if value == true }
    final_result = required_contract_hash.join('/')
    short_desc(final_result, 25)
  end
end
