module FilesMethods

  def photos_initial_situation_presented?(fotos)
    allowed = !fotos.empty?
    response = allowed ? I18n.t('photos_initial_situation_presented?(fotos).responses.fotos_present') : I18n.t('photos_initial_situation_presented?(fotos).responses.fotos_not_present')
    format_result_methods_response(allowed, response)
  end

  def situational_plan_presented?(plan)
    allowed = !plan.nil?
    response = allowed ? I18n.t('situational_plan_presented?(plan).responses.plan_present') : I18n.t('situational_plan_presented?(plan).responses.plan_not_present')
    format_result_methods_response(allowed, response)
  end

  def photos_projected_constructions_presented?(fotos)
    allowed = !fotos.empty?
    response = allowed ? I18n.t('photos_projected_constructions_presented?(fotos).responses.fotos_present') : I18n.t('photos_projected_constructions_presented?(fotos).responses.fotos_not_present')
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