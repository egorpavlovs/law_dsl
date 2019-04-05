require_relative 'dsl'

# request = {
#   "заявитель"=>"физическое лицо"
# }

# dsl = Dsl.new(request)
# p dsl.apply_scenario('scenarios/test')

request = {
  "заявитель"=>"физическое лицо"
}
scenario = 'scenarios/test'
p Dsl.get_request(request, scenario)
