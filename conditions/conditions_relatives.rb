require_relative 'applicant_methods'
require_relative 'documents_methods'
require_relative 'files_methods'
require_relative 'egrul_methods'
module ConditionsRelatives
  include ApplicantMethods
  include DocumentsMethods
  include FilesMethods
  include EgrulMethods


  def project_agreed?(*args)
    method_name =__method__.to_s
    allowed = !args.first.nil?
    response = allowed ? 'project_agreed' : 'project_not_agreed'
    format_result_methods_response(method_name, allowed, response)
  end
end