require_relative 'application_methods'
module DocumentsMethods

  def statement_sni_filed?(arg)
    method_name =__method__.to_s
    get_data_for_method_arg(method_name, arg.to_s)
    allowed = !get_data_for_method_arg(method_name, arg.to_s).nil?
    response = allowed ? "statement_sni_filed" : "statement_sni_not_filed"
    format_result_methods_response(method_name, allowed, response)
  end

  def technical_inventory_documents_represented?(arg, documents_names)
    method_name =__method__.to_s
    documents = get_data_for_method_arg(method_name, arg.to_s)
    errors = documents_names.map do |document_name|
      unless documents.map{|e| e['name'] unless e['document'].to_s.empty?}.compact.include?(document_name)
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