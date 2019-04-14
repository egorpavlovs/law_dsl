module ApplicantMethods
  # include do
  def natural_person?(applicant)
    allowed = I18n.t('natural_person?(applicant).rigth_data').include?(applicant)
    response = allowed ? I18n.t('natural_person?(applicant).responses.allowed') : I18n.t('natural_person?(applicant).responses.not_allowed')
    format_result_methods_response(allowed, response)
  end

  def legal_entity?(applicant)
    allowed = I18n.t('legal_entity?(applicant).rigth_data').include?(applicant)
    response = allowed ? I18n.t('legal_entity?(applicant).responses.allowed') : I18n.t('legal_entity?(applicant).responses.not_allowed')
    format_result_methods_response(allowed, response)
  end

  def individual_entrepreneur?(applicant)
    allowed = I18n.t('individual_entrepreneur?(applicant).rigth_data').include?(applicant)
    response = allowed ? I18n.t('individual_entrepreneur?(applicant).responses.allowed') : I18n.t('individual_entrepreneur?(applicant).responses.not_allowed')
    format_result_methods_response(allowed, response)
  end

  def agent?(applicant)
    allowed = I18n.t('agent?(applicant).rigth_data').include?(applicant)
    response = allowed ? I18n.t('agent?(applicant).responses.allowed') : I18n.t('agent?(applicant).responses.not_allowed')
    format_result_methods_response(allowed, response)
  end

  def applicant_identity_esia?(esia_data)
    allowed = esia_data.nil?
    response = allowed ? I18n.t('applicant_identity_esia?(esia_data).responses.esia_data_present') : I18n.t('agent?(applicant).responses.esia_data_not_present')
    format_result_methods_response(allowed, response)
  end
end