require_relative 'application_methods'
module FilesMethods

  def photos_initial_situation_presented?(arg)
    method_name =__method__.to_s
    allowed = !get_data_for_method_arg(method_name, arg.to_s).nil?
    response = allowed ? "photos_initial_situation_presented" : "photos_initial_situation_presented"
    format_result_methods_response(method_name, allowed, response)
  end

  def situational_plan_presented?(arg)
    method_name =__method__.to_s
    allowed = !get_data_for_method_arg(method_name, arg.to_s).nil?
    response = allowed ? "situational_plan_presented" : "situational_plan_not_presented"
    format_result_methods_response(method_name, allowed, response)
  end

  def photos_projected_constructions_presented?(arg)
    method_name =__method__.to_s
    allowed = !get_data_for_method_arg(method_name, arg.to_s).nil?
    response = allowed ? 'photos_projected_constructions_presented' : 'photos_projected_constructions_not_presented'
    format_result_methods_response(method_name, allowed, response)
  end

  def topographic_plan_with_scale_presented?(arg, scale)
    method_name =__method__.to_s
    plan = get_data_for_method_arg(method_name, arg.to_s)

    if plan['file'].nil?
      allowed = false
      response = "topographic_plan_with_scale_not_presented"
    elsif plan['scale'] != scale
      allowed = false
      response = "topographic_plan_with_wrong_scale_presented"
    else
      allowed = true
      response = "topographic_plan_with_scale_presented"
    end
    format_result_methods_response(method_name, allowed, response)
  end
end