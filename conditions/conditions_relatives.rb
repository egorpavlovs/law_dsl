require_relative 'applicant_methods'
require_relative 'documents_methods'
require_relative 'files_methods'
module ConditionsRelatives
  include ApplicantMethods
  include DocumentsMethods
  include FilesMethods


  def проект_согласован?(project_number)
    #Здесь должен быть запрос куда-то? Или сразу приходит ответ
    allowed = !project_number.to_s.empty?
    response = allowed ? "Проект согласован" : "Проект не согласован"
    format_result_methods_response(allowed, response)
  end

end