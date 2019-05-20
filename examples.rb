require 'yaml'
require 'json'
require_relative 'dsl'

# request = {
#   "topographic_plan_with_scale" => {
#     "file" => "ссылка S3",
#     "scale" => "1:200"
#   }
# }
# scenario = 'scenarios/test/ru.test.md'
# p Dsl.make_decision(request, scenario, 'ru')


# scenario = 'scenarios/new_signboard/ru.new_signboard.md'
# request_file_name = 'requests/ru.new_signboard.yaml'
# request =YAML::load(File.open(request_file_name))
# p Dsl.make_decision(request, scenario, 'ru')


# request = {
#   "topographic_plan_with_scale" => {
#     "file" => 'https://example.com/6',
#     "scale" => '1:200'
#   }
# }
# scenario = 'scenarios/test/ru.test.md'

# p Dsl.make_decision(request, scenario, 'ru')

# scenario = 'scenarios/new_signboard/ru.new_signboard.md'
# request_file_name = 'requests/ru.new_signboard.yaml'
# request =YAML::load(File.open(request_file_name))
# p Dsl.make_decision(request, scenario, 'ru')

scenario = 'scenarios/ru.egrul.md'
request_file_name = 'requests/queries/ispolkom_egrul.json'
request =JSON.parse(File.read(request_file_name))
p Dsl.make_decision(request, scenario, 'ru')