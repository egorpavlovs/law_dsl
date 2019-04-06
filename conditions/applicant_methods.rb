module ApplicantMethods
  # include do
  def физическое_лицо?(applicant)
    allowed = ["физическое лицо", "физ лицо"].include?(applicant)
    response = allowed ? allowed : "Заявитель не явлется физическим лицом"
    format_result_methods_response(allowed, response)
  end

  def юридическое_лицо?(applicant)
    allowed = ["юридическое лицо", "юр лицо"].include?(applicant)
    response = allowed ? allowed : "Заявитель не явлется юридическим лицом"
    format_result_methods_response(allowed, response)
  end

  def индивидуальный_предприниматель?(applicant)
    allowed = ["индивидуальный предприниматель", "ип"].include?(applicant)
    response = allowed ? allowed : "Заявитель не явлется индивидуальным предпринимателем"
    format_result_methods_response(allowed, response)
  end

  def доверенное_лицо?(applicant)
    allowed = ["доверенное лицо"].include?(applicant)
    response = allowed ? allowed : "Заявитель не явлется доверенным лицом"
    format_result_methods_response(allowed, response)
  end

  def личность_заявителя_подтверждена_документ?(document_applicant)
    # Должны быть уже подтвержденные бумажные документы?
    allowed = document_applicant.present?
    response = allowed ? allowed : "Личность заявителя не подтверждена"
    format_result_methods_response(allowed, response)
  end

  # TODO: Реализовать запросы для подверждения личности (узать как это делается на практике)
  def личность_заявителя_подтверждена_есиа?(document_applicant)
    allowed = document_applicant.present?
    response = allowed ? allowed : "Личность заявителя не подтверждена, электронные реквизиты ЕСИА неправильные"
    format_result_methods_response(allowed, response)
  end

end