require 'yaml'
require_relative 'dsl'

# request = {
#   "topographic_plan_with_scale" => {
#     "file" => "ссылка S3",
#     "scale" => "1:200"
#   }
# }
# scenario = 'scenarios/ru.test.md'
# p Dsl.make_decision(request, scenario, 'ru')


# scenario = 'scenarios/ru.new_signboard.md'
# request_file_name = 'requests/ru.new_signboard.yaml'
# request =YAML::load(File.open(request_file_name))
# p Dsl.make_decision(request, scenario, 'ru')


# request = {
#   "applicant" => "natural person"
# }
# scenario = 'scenarios/tat.test.md'
# p Dsl.make_decision(request, scenario, 'ru')

scenario = 'scenarios/tat.new_signboard.md'
request_file_name = 'requests/tat.new_signboard.yaml'
request =YAML::load(File.open(request_file_name))
p Dsl.make_decision(request, scenario, 'ru')