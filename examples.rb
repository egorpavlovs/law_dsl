require 'yaml'
require_relative 'dsl'


request = {
  "заявитель"=>"физическое лицо"
}
scenario = 'scenarios/test.md'
p Dsl.make_decision(request, scenario)


# scenario = 'scenarios/new_signboard.md'
# request_file_name = 'requests/new_signboard.yaml'
# request =YAML::load(File.open(request_file_name))
# p Dsl.make_decision(request, scenario)
