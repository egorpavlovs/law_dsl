require 'yaml'
require_relative 'dsl'

# x = Dsl.new({})
# x.new_method(:mymeth) { puts "Это мой метод." }
# x.mymeth # Печатается "Это мой метод."

request = {
  "technical_inventory_documents"=> [
    {
      "name"=> "план помещения",
      "document"=> "ссылка S3"
    }
  ]
}
scenario = 'scenarios/ru.test.md'
p Dsl.make_decision(request, scenario)


# scenario = 'scenarios/new_signboard.md'
# request_file_name = 'requests/new_signboard.yaml'
# request =YAML::load(File.open(request_file_name))
# p Dsl.make_decision(request, scenario)
