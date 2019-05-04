module ApplicantMethods
  # include do
  def natural_person?(arg, &block)
    # В arg прилетает :заявитель, он как раз нужен для перевода его в applicant
    applicant = block.call
    # Здесь должен быть этот код из блока:
    # method_name =__method__.to_s
    # translate_arg = @translate_scenario.method_arg_from_value(method_name, arg.to_s)
    # applicant =  @request_hash[translate_arg]
    allowed = applicant == "natural person"
    response = allowed? ? "natural_person" : "not_natural_person"
    format_result_methods_response(allowed, response)
  end

  def legal_entity?(applicant)
    allowed = applicant == "legal person"
    response = allowed? ? "legal_entity" : "not_legal_entity"
    format_result_methods_response(allowed, response)
  end

  def individual_entrepreneur?(applicant)
    allowed = applicant == "individual_entrepreneur"
    response = allowed? ? "individual_entrepreneur" : "not_individual_entrepreneur"
    format_result_methods_response(allowed, response)
  end

  # def natural_person?(applicant)
  #   allowed = I18n.t('natural_person?(applicant).rigth_data').include?(applicant)
  #   response = allowed ? I18n.t('natural_person?(applicant).responses.allowed') : I18n.t('natural_person?(applicant).responses.not_allowed')
  #   format_result_methods_response(allowed, response)
  # end

  # def legal_entity?(applicant)
  #   allowed = I18n.t('legal_entity?(applicant).rigth_data').include?(applicant)
  #   response = allowed ? I18n.t('legal_entity?(applicant).responses.allowed') : I18n.t('legal_entity?(applicant).responses.not_allowed')
  #   format_result_methods_response(allowed, response)
  # end

  # def individual_entrepreneur?(applicant)
  #   allowed = I18n.t('individual_entrepreneur?(applicant).rigth_data').include?(applicant)
  #   response = allowed ? I18n.t('individual_entrepreneur?(applicant).responses.allowed') : I18n.t('individual_entrepreneur?(applicant).responses.not_allowed')
  #   format_result_methods_response(allowed, response)
  # end

  # def agent?(applicant)
  #   allowed = I18n.t('agent?(applicant).rigth_data').include?(applicant)
  #   response = allowed ? I18n.t('agent?(applicant).responses.allowed') : I18n.t('agent?(applicant).responses.not_allowed')
  #   format_result_methods_response(allowed, response)
  # end

  # def applicant_identity_esia?(esia_data)
  #   allowed = !esia_data.nil?
  #   response = allowed ? I18n.t('applicant_identity_esia?(esia_data).responses.esia_data_present') : I18n.t('agent?(applicant).responses.esia_data_not_present')
  #   format_result_methods_response(allowed, response)
  # end

  alias_method :физическое_лицо?, :natural_person?
  alias_method :юридическое_лицо?, :legal_entity?
  alias_method :индивидуальный_предприниматель?, :individual_entrepreneur?
end