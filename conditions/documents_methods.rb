require_relative 'application_methods'
module DocumentsMethods

  def statement_sni_filed?(*args)
    input_data = args.flatten
    method_name =__method__.to_s
    allowed = input_data.last.dig(*%W(#{input_data.first} confirmed_from_department))
    response = allowed ? "statement_sni_filed" : "statement_sni_not_filed"
    format_result_methods_response(method_name, allowed, response)
  end

  def technical_inventory_documents_represented?(*args)
    input_data = args.first
    documents_names = args.last
    method_name =__method__.to_s
    documents = input_data.last.dig(*%W(#{input_data.first}))

    method_name =__method__.to_s
    errors = documents_names.map do |document_name|
      unless documents.map{|e| e['name'] if e['confirmed_from_department']}.compact.include?(document_name)
        document_name
      end
    end
    allowed = errors.compact.empty?
    response = if allowed
      "technical_inventory_documents_represented"
    else
      "technical_inventory_documents_not_represented"
    end
    format_result_methods_response(method_name, allowed, response)
  end
end