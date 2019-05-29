require_relative 'application_methods'
module ApplicantMethods
  include ApplicationMethods

  def natural_person?(*args)
    method_name =__method__.to_s
    key_with_data = args.first
    key = key_with_data.first
    allowed = key_with_data.last.dig(*%w(applicant role)) == "natural person"
    response = allowed ? "natural_person" : "not_natural_person"
    format_result_methods_response(method_name, allowed, response)
  end

  def legal_entity?(*args)
    method_name =__method__.to_s
    key_with_data = args.first
    key = key_with_data.first
    allowed = key_with_data.last.dig(*%w(applicant role)) == "legal entity"
    response = allowed ? "legal_entity" : "not_legal_entity"
    format_result_methods_response(method_name, allowed, response)
  end

  def individual_entrepreneur?(*args)
    method_name =__method__.to_s
    key_with_data = args.first
    key = key_with_data.first
    allowed = key_with_data.last.dig(*%w(applicant role)) == "individual entrepreneur"
    response = allowed ? "individual_entrepreneur" : "not_individual_entrepreneur"
    format_result_methods_response(method_name, allowed, response)
  end

  def agent?(*args)
    method_name =__method__.to_s
    key_with_data = args.first
    key = key_with_data.first
    allowed = key_with_data.last.dig(*%w(applicant role)) == "agent"
    response = allowed ? "agent" : "not_agent"
    format_result_methods_response(method_name, allowed, response)
  end

  def applicant_identity_esia?(*args)
    key_with_data = args.first
    key = key_with_data.first
    method_name =__method__.to_s
    esia_data = key_with_data.last[key]
    allowed = !esia_data.nil?
    response = allowed ? "esia_data_present" : "esia_data_not_present"
    format_result_methods_response(method_name, allowed, response)
  end
end