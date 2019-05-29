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
end