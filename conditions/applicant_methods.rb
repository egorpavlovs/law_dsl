module ApplicantMethods
  # include do
  def физическое_лицо?(applicant)
    allowed = ["физическое лицо", "физ лицо"].include?(applicant)
    response = allowed ? allowed : "Не явлется физическим лицом"
    format_result_methods_response(allowed, response)
  end

  def юридическое_лицо?(applicant)
    allowed = ["юридическое лицо", "юр лицо"].include?(applicant)
    response = allowed ? allowed : "Не явлется юридическим лицом"
    format_result_methods_response(allowed, response)
  end

  def индивидуальный_предприниматель?(applicant)
    allowed = ["индивидуальный предприниматель", "ип"].include?(applicant)
    response = allowed ? allowed : "Не явлется индивидуальным предпринимателем"
    format_result_methods_response(allowed, response)
  end

  def доверенное_лицо?(applicant)
    allowed = ["доверенное лицо"].include?(applicant)
    response = allowed ? allowed : "Не явлется доверенным лицом"
    format_result_methods_response(allowed, response)
  end

end