require 'yaml'
require_relative 'dsl'


# request = {
#   "заявитель"=>"физическое лицо"
# }
# scenario = 'scenarios/test'
# p Dsl.make_decision(request, scenario)


scenario = 'scenarios/new_signboard'
request_file_name = 'requests/new_signboard.yaml'
request =YAML::load(File.open(request_file_name))
pp request
p Dsl.make_decision(request, scenario)
