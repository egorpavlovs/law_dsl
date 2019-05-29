require_relative 'application_methods'
module EgrulMethods

  def legal_entity_liquidate?(*args)
    method_name =__method__.to_s
    legal_entity_status_key = args.flatten.first
    legal_entity_status_data = args.flatten.last
    legal_entity_status = legal_entity_status_data.dig(*%W(egrul_query_result СвЮЛ #{legal_entity_status_key}))
    liquidate_code = [701, 702, 801]
    liquidate_status = liquidate_code.map { |code| code if code.to_s == legal_entity_status }.empty?
    response = liquidate_status ? 'legal_entity_liquidate' : 'legal_entity_not_liquidate'
    format_result_methods_response(method_name, liquidate_status, response)
  end

  def legal_entity_process_liquidate?(*args)
    method_name =__method__.to_s
    legal_entity_status_key = args.flatten.first
    legal_entity_status_data = args.flatten.last
    legal_entity_status = legal_entity_status_data.dig(*%W(egrul_query_result СвЮЛ #{legal_entity_status_key}))
    liquidate_code = [101]
    liquidate_status = liquidate_code.map { |code| code if code.to_s == legal_entity_status }.empty?
    response = liquidate_status ? 'legal_entity_process_liquidate' : 'legal_entity_not_process_liquidate'
    format_result_methods_response(method_name, liquidate_status, response)
  end

  def can_applicant_represent_legal_entity?(*args)
    method_name =__method__.to_s
    agent_applicant_key_data = args.first
    agent_applicant_data = agent_applicant_key_data.last[agent_applicant_key_data.first]
    agent_egrul_key_data = args.last
    agent_egrul_key = agent_egrul_key_data.first
    agent_egrul_data = agent_egrul_key_data.last
    agent_egrul = agent_egrul_data.dig(*%W(egrul_query_result СвЮЛ #{agent_egrul_key}))
    allowed = agent_egrul.dig(*%w(СвФЛ ИННФЛ)) == agent_applicant_data['inn']
    response = allowed ? 'applicant_can_represent_legal_entity' : 'applicant_cant_represent_legal_entity'
    format_result_methods_response(method_name, allowed, response)
  end

  def region_registration_legal_entity_match_egrul?(*args)
    method_name =__method__.to_s
    egrul_region_data = args.first
    key_name = egrul_region_data.first
    egrul_region = egrul_region_data.last.dig(*%W(egrul_query_result СвЮЛ СвАдресЮЛ АдресРФ Регион #{key_name}))
    input_region = args.last

    allowed = input_region.downcase == egrul_region.downcase
    response = allowed ? "region_registration_legal_entity_match" : "region_registration_legal_entity_not_match"
    format_result_methods_response(method_name, allowed, response)
  end

  def city_registration_legal_entity_match_egrul?(*args)
    method_name =__method__.to_s
    egrul_city_data = args.first
    key_name = egrul_city_data.first
    egrul_city = egrul_city_data.last.dig(*%W(egrul_query_result СвЮЛ СвАдресЮЛ АдресРФ Город #{key_name}))
    input_city = args.last

    allowed = input_city.downcase == egrul_city.downcase
    response = allowed ? "city_registration_legal_entity_match" : "city_registration_legal_entity_not_match"
    format_result_methods_response(method_name, allowed, response)
  end

  def legal_entity_registered_more_given_years?(*args)
    method_name =__method__.to_s
    data = args.first
    key_name = data.first
    date_registration = data.last.dig(*%W(egrul_query_result СвЮЛ #{key_name}))
    input_years = args.last

    allowed = Time.new(date_registration).year <= Time.now.year - input_years.to_i
    response = allowed ? "legal_entity_registered_more_given_years" : "legal_entity_registered_less_given_years"
    format_result_methods_response(method_name, allowed, response)
  end

  def legal_entity_registered_in_given_pension_fund?(*args)
    method_name =__method__.to_s
    data = args.first
    key_name = data.first
    egrul_pension_fund_code = data.last.dig(*%W(egrul_query_result СвЮЛ СвРегПФ СвОргПФ #{key_name}))
    input_code = args.last

    allowed = input_code == egrul_pension_fund_code
    response = allowed ? "legal_entity_registered_in_given_pension_fund" : "legal_entity_not_registered_in_given_pension_fund"
    format_result_methods_response(method_name, allowed, response)
  end
end