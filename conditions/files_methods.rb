require_relative 'application_methods'
module FilesMethods

  def photos_initial_situation_presented?(*args)
    method_name =__method__.to_s
    allowed = !args.first.nil?
    response = allowed ? "photos_initial_situation_presented" : "photos_initial_situation_presented"
    format_result_methods_response(method_name, allowed, response)
  end

  def situational_plan_presented?(*args)
    method_name =__method__.to_s
    allowed = !args.first.nil?
    response = allowed ? "situational_plan_presented" : "situational_plan_not_presented"
    format_result_methods_response(method_name, allowed, response)
  end

  def photos_projected_constructions_presented?(*args)
    method_name =__method__.to_s
    allowed = !args.first.nil?
    response = allowed ? 'photos_projected_constructions_presented' : 'photos_projected_constructions_not_presented'
    format_result_methods_response(method_name, allowed, response)
  end

  def topographic_plan_with_scale_presented?(*args)
    p ['args', args]
    method_name =__method__.to_s
    plan = args.first
    scale = args.last

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