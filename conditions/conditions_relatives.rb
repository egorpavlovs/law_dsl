require_relative 'applicant_methods'
require_relative 'documents_methods'
require_relative 'files_methods'
module ConditionsRelatives
  include ApplicantMethods
  include DocumentsMethods
  include FilesMethods


  def project_agreed?(arg)
    method_name =__method__.to_s
    allowed = !get_data_for_method_arg(method_name, arg.to_s).nil?
    response = allowed ? 'project_agreed' : 'project_not_agreed'
    format_result_methods_response(method_name, allowed, response)
  end
end