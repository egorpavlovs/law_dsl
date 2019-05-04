require_relative 'application_methods'
module DocumentsMethods

  def statement_sni_filed?(statement_sni)
    allowed = !statement_sni.nil?
    response = allowed ? I18n.t('statement_sni_filed?(statement_sni).responses.statement_sni_present') : I18n.t('statement_sni_filed?(statement_sni).responses.statement_sni_present_not_present')
    format_result_methods_response(allowed, response)
  end

  def документы_технической_инвентаризации_представлены?(documents, documents_names)
    errors = documents_names.map do |document_name|
      unless documents.map{|e| e['наименование'] unless e['документ'].to_s.empty?}.compact.include?(document_name)
        document_name
      end
    end
    allowed = errors.compact.empty?
    response = if allowed
      "Необходимые документы технической инвентаризации присутствуют"
    else
      "Отсутствуют необходимые документы технической инвентаризации - #{errors.join(", ")}"
    end
    format_result_methods_response(allowed, response)
  end
end