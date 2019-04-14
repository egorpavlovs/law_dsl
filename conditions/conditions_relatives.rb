require_relative 'applicant_methods'
require_relative 'documents_methods'
require_relative 'files_methods'
module ConditionsRelatives
  include ApplicantMethods
  include DocumentsMethods
  include FilesMethods


  def project_agreed?(project_number)
    allowed = !project_number.nil?
    response = allowed ? I18n.t('project_agreed?(project_number).responses.project_number_present') : I18n.t('project_agreed?(project_number).responses.project_number_not_present')
    format_result_methods_response(allowed, response)
  end
end