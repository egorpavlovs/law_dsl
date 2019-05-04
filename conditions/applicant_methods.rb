require_relative 'application_methods'
module ApplicantMethods
  include ApplicationMethods

  def natural_person?(arg)
    method_name =__method__.to_s
    applicant = get_data_for_method_arg(method_name, arg.to_s)
    allowed = applicant == "natural person"
    response = allowed ? "natural_person" : "not_natural_person"
    format_result_methods_response(method_name, allowed, response)
  end

  def legal_entity?(arg)
    method_name =__method__.to_s
    applicant = get_data_for_method_arg(method_name, arg.to_s)
    allowed = applicant == "legal person"
    response = allowed ? "legal_entity" : "not_legal_entity"
    format_result_methods_response(method_name, allowed, response)
  end

  def individual_entrepreneur?(arg)
    method_name =__method__.to_s
    applicant = get_data_for_method_arg(method_name, arg.to_s)
    allowed = applicant == "individual entrepreneur"
    response = allowed ? "individual_entrepreneur" : "not_individual_entrepreneur"
    format_result_methods_response(method_name, allowed, response)
  end

  def agent?(arg)
    method_name =__method__.to_s
    applicant = get_data_for_method_arg(method_name, arg.to_s)
    allowed = applicant == "agent"
    response = allowed ? "agent" : "not_agent"
    format_result_methods_response(allowed, response)
  end

  def applicant_identity_esia?(arg)
    method_name =__method__.to_s
    esia_data = get_data_for_method_arg(method_name, arg.to_s)
    allowed = !esia_data.nil?
    response = allowed ? "esia_data_present" : "esia_data_not_present"
    format_result_methods_response(allowed, response)
  end
end