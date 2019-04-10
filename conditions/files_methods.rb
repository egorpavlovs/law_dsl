module FilesMethods

  def фотофиксация_исходной_ситуации_представлена?(fotos)
    allowed = !fotos.empty?
    response = allowed ? allowed : "Фотофиксация исходной ситуации не представлена"
    format_result_methods_response(allowed, response)
  end

  def ситуационный_план_представлен?(plan)
    allowed = !plan.nil?
    response = allowed ? allowed : "Ситуационного плана не представлено"
    format_result_methods_response(allowed, response)
  end

  def изображения_проектируемых_конструкций_представлены?(fotos)
    allowed = !fotos.empty?
    response = allowed ? allowed : "Не представлены изображения проектируемых конструкций"
    format_result_methods_response(allowed, response)
  end

  def топографический_план_с_маштабом_представлен?(plan, scale)
    if plan['файл'].nil?
      allowed = false
      response = "Топографический план не представлен"
    elsif plan['маштаб'] != scale
      allowed = false
      response = "Топографический план представлен в не подходящем формате"
    else
      allowed = true
      response = "Топографический план представлен в подходящем формате"
    end
    format_result_methods_response(allowed, response)
  end
end