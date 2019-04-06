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
end