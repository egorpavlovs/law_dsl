module DocumentsMethods
  def бумажное_заявление_сни?(statement)
    # TODO: Запрос на наличине заявление СНИ - statement['номер']
    allowed = statement['тип'] == "бумажное"
    response = allowed ? allowed : "Бумажное заявление не подано"
    format_result_methods_response(allowed, response)
  end

  def электронное_заявление_сни?(statement)
    # TODO: Запрос на наличине заявление СНИ - statement['номер']
    allowed = statement['тип'] == "бумажное"
    response = allowed ? allowed : "Электронное заявление не подано"
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