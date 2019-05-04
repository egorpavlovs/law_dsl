require 'yaml'
require_relative 'dsl'

# x = Dsl.new({})
# x.new_method(:mymeth) { puts "Это мой метод." }
# x.mymeth # Печатается "Это мой метод."

# request = {
#   "topographic_plan_with_scale" => {
#     "file" => "ссылка S3",
#     "scale" => "1:200"
#   }
# }
# scenario = 'scenarios/ru.test.md'
# p Dsl.make_decision(request, scenario)


scenario = 'scenarios/ru.new_signboard.md'
request_file_name = 'requests/new_signboard.yaml'
request =YAML::load(File.open(request_file_name))
p Dsl.make_decision(request, scenario)
