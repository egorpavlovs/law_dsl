require_relative 'application_methods'
module EgrulMethods
  def information_from_egrul_represented?(*args)
    p ['args', args]
    # p ['args1', args.first]
    # method_name =__method__.to_s
    # if args.first.nil?
    #   format_result_methods_response(method_name, false, 'information_from_egrul_not_present')
    # else
    #   method_operand = format_result_methods_response(method_name, true, 'information_from_egrul_present')
    #   dsl = Dsl.new(args.first, self.scenario_language, self.response_language)
    #   egrul_id_document_result = dsl.egrul_id_document_represented?(dsl.egrul_id_document)
    #   egrul_legal_entity_information_result = dsl.egrul_legal_entity_information_represented?(dsl.egrul_legal_entity_information)
    #   combine_dsl_operands([method_operand, egrul_id_document_result, egrul_legal_entity_information_result])
    # end
  end

  def egrul_id_document_represented?(*args)
    method_name =__method__.to_s
    id_document = args.first
    allowed = !id_document.nil?
    response = allowed ? "id_document_present" : "id_document_not_present"
    format_result_methods_response(method_name, allowed, response)
  end

  def egrul_legal_entity_information_represented?(*args)
    method_name =__method__.to_s
    if args.first.nil?
      format_result_methods_response(method_name, false, 'egrul_legal_entity_information_not_present')
    else
      format_result_methods_response(method_name, true, 'egrul_legal_entity_information_present')
    end
  end
end